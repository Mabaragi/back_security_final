#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y curl unzip docker.io

if ! command -v aws >/dev/null 2>&1; then
  curl -fsSL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip
  rm -rf /tmp/aws
  unzip -q /tmp/awscliv2.zip -d /tmp
  /tmp/aws/install --update
fi

systemctl enable --now docker
systemctl enable --now snap.amazon-ssm-agent.amazon-ssm-agent.service || systemctl enable --now amazon-ssm-agent || true

usermod -aG docker ubuntu || true
mkdir -p /home/ubuntu/app/mysql
chown -R ubuntu:ubuntu /home/ubuntu/app

echo "EC2 bootstrap complete. App port: ${app_port}"
