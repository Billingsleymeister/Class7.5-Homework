#!/bin/bash
# 1. System Prep
apt-get update -y
apt-get install -y nginx curl jq

# 2. Metadata Helper
METADATA="http://metadata.google.internal/computeMetadata/v1"
HDR="Metadata-Flavor: Google"
md() { curl -fsS -H "$HDR" "$METADATA/$1" || echo "unknown"; }

# 3. Grab Data (Simplest method)
# We use ##*/ to just grab the 'name' at the end of the long GCP URL path
ZONE_URL=$(md instance/zone)
ZONE="${ZONE_URL##*/}"
REGION="${ZONE%-*}"

VPC_URL=$(md instance/network-interfaces/0/network)
VPC="${VPC_URL##*/}"

SUBNET_URL=$(md instance/network-interfaces/0/subnetwork)
SUBNET="${SUBNET_URL##*/}"

# 4. Create Files for the Gate
mkdir -p /var/www/html
echo "ok" > /var/www/html/healthz
echo "<h1>Success</h1>" > /var/www/html/index.html

# This creates the exact JSON structure the gate is hunting for
cat > /var/www/html/metadata.json <<EOF
{
  "region": "$REGION",
  "network": {
    "vpc": "$VPC",
    "subnet": "$SUBNET"
  }
}
EOF

# 5. Finalize Nginx
cat > /etc/nginx/sites-available/default <<'EOF'
server {
    listen 80 default_server;
    root /var/www/html;
    index index.html;
    location /healthz { default_type text/plain; }
    location /metadata { default_type application/json; }
}
EOF

systemctl restart nginx