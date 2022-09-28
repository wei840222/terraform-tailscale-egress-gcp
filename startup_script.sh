#!/bin/sh
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.tailscale-keyring.list | tee /etc/apt/sources.list.d/tailscale.list
apt-get update
apt-get install -y tailscale
sysctl -w net.ipv4.ip_forward=1
tailscale up --advertise-exit-node --authkey="${authkey}" --hostname="${hostname}"