#!/bin/bash
set -euo pipefail

#Chewbacca: This node serves proof-of-life.
apt-get update -y
apt-get install -y nginx curl jq

METADATA="http://metadata.google.internal/computeMetadata/v1"
HDR="Metadata-Flavor: Google"
md() { curl -fsS -H "$HDR" "${METADATA}/$1" || echo "unknown"; }

INSTANCE_NAME="$(md instance/name)"
HOSTNAME="$(hostname)"
PROJECT_ID="$(md project/project-id)"
ZONE_FULL="$(md instance/zone)"
ZONE="${ZONE_FULL##*/}"
REGION="${ZONE%-*}"

INTERNAL_IP="$(md instance/network-interfaces/0/ip)"
EXTERNAL_IP="$(md instance/network-interfaces/0/access-configs/0/external-ip)"
VPC_FULL="$(md instance/network-interfaces/0/network)"
SUBNET_FULL="$(md instance/network-interfaces/0/subnetwork)"
VPC="${VPC_FULL##*/}"
SUBNET="${SUBNET_FULL##*/}"

STUDENT_NAME="$(md instance/attributes/student_name)"
[[ -z "$STUDENT_NAME" || "$STUDENT_NAME" == "unknown" ]] && STUDENT_NAME="Anonymous Padawan (temporarily)"

START_TIME_UTC="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
UPTIME="$(uptime -p || true)"
LOADAVG="$(awk '{print $1" "$2" "$3}' /proc/loadavg 2>/dev/null || echo "unknown")"

MEM_TOTAL_MB="$(free -m | awk '/Mem:/ {print $2}')"
MEM_USED_MB="$(free -m | awk '/Mem:/ {print $3}')"
MEM_FREE_MB="$(free -m | awk '/Mem:/ {print $4}')"

DISK_LINE="$(df -h / | tail -n 1)"
DISK_SIZE="$(echo "$DISK_LINE" | awk '{print $2}')"
DISK_USED="$(echo "$DISK_LINE" | awk '{print $3}')"
DISK_AVAIL="$(echo "$DISK_LINE" | awk '{print $4}')"
DISK_USEP="$(echo "$DISK_LINE" | awk '{print $5}')"

cat > /etc/nginx/sites-available/default <<'EOF'
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    location = / {
        try_files /index.html =404;
    }

    location = /healthz {
        default_type text/plain;
        return 200 "ok\n";
    }

    location = /metadata {
        default_type application/json;
        try_files /metadata.json =404;
    }
}
EOF

cat > /var/www/html/metadata.json <<EOF
{
  "service": "seir-i-node",
  "student_name": "$STUDENT_NAME",
  "project_id": "$PROJECT_ID",
  "instance_name": "$INSTANCE_NAME",
  "hostname": "$HOSTNAME",
  "region": "$REGION",
  "zone": "$ZONE",
  "network": {
    "vpc": "$VPC",
    "subnet": "$SUBNET",
    "internal_ip": "$INTERNAL_IP",
    "external_ip": "$EXTERNAL_IP"
  },
  "health": {
    "uptime": "$UPTIME",
    "load_avg": "$LOADAVG",
    "ram_mb": {"used": $MEM_USED_MB, "free": $MEM_FREE_MB, "total": $MEM_TOTAL_MB},
    "disk_root": {"size": "$DISK_SIZE", "used": "$DISK_USED", "avail": "$DISK_AVAIL", "use_pct": "$DISK_USEP"}
  },
  "startup_utc": "$START_TIME_UTC"
}
EOF

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>SEIR-I Lab 2 — Terraform Node</title>
  <meta http-equiv="refresh" content="10">
  <style>
    body { background:#0b0c10; color:#c5c6c7; font-family: monospace; }
    .wrap { max-width: 900px; margin: 40px auto; padding: 20px; border:1px solid #45a29e; border-radius:12px; }
    h1 { color:#66fcf1; }
    .k { color:#66fcf1; }
    a { color:#66fcf1; }
  </style>
</head>
<body>
  <div class="wrap">
    <h1>⚡ SEIR-I Lab 2 — Terraform Deployment Success ⚡</h1>
    <p><span class="k">Deploy Banner:</span> $STUDENT_NAME</p>
    <p><span class="k">Region:</span> $REGION <span class="k">Zone:</span> $ZONE</p>
    <p><span class="k">VPC:</span> $VPC <span class="k">Subnet:</span> $SUBNET</p>
    <p><span class="k">External IP:</span> $EXTERNAL_IP</p>
    <p><a href="/healthz">/healthz</a> | <a href="/metadata">/metadata</a></p>
    <p>#Chewbacca: You didn’t click your way here. You automated.</p>
  </div>
</body>
</html>
EOF

systemctl enable nginx >/dev/null 2>&1 || true
systemctl restart nginx
