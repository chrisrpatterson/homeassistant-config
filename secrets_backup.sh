#!/bin/bash

# Open STDOUT as file for read and write.
exec 1<>/config/secrets_backup.log
# Redirect STDERR to STDOUT
exec 2>&1

pushd /config

# Use this (should only need to do it once) if you get a host verification error from scp
# ssh-keyscan -H home-nas.lan >> ~/.ssh/known_hosts

# Skipping these for now
# scp home-assistant_v2.db peter@home-nas.lan:~/home-assistant-secrets
# scp pyozw.sqlite peter@home-nas.lan:~/home-assistant-secrets

# HA Secrets
scp -v -i /config/.ssh/id_rsa known_devices.yaml peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa secrets.yaml peter@home-nas.lan:~/home-assistant-secrets

# Generated Files
scp -v -i /config/.ssh/id_rsa .ios.conf peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa .ring_cache.pickle peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa ecobee.conf peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa home-assistant.log peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa ip_bans.yaml peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa life360.conf peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa plex.conf peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa sabnzbd.conf peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa ui-lovelace.yaml peter@home-nas.lan:~/home-assistant-secrets

# OZW Files
scp -v -i /config/.ssh/id_rsa OZW_Log.txt peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa zwcfg_0xc13cc76f.xml peter@home-nas.lan:~/home-assistant-secrets
scp -v -i /config/.ssh/id_rsa zwscene.xml peter@home-nas.lan:~/home-assistant-secrets

popd