#!/bin/bash

echo "🛠️  Creating 'deploy' user and setting permissions..."

sudo adduser --disabled-password --gecos "" deploy
sudo usermod -aG docker deploy

sudo mkdir -p /home/deploy/.ssh
sudo cp ~/.ssh/authorized_keys /home/deploy/.ssh/
sudo chown -R deploy:deploy /home/deploy/.ssh
sudo chmod 700 /home/deploy/.ssh
sudo chmod 600 /home/deploy/.ssh/authorized_keys

sudo mkdir -p /home/deploy/cjapay/logs
sudo chown -R deploy:deploy /home/deploy/cjapay

if [ -f /home/deploy/cjapay/.env ]; then
  sudo chown deploy:deploy /home/deploy/cjapay/.env
  sudo chmod 600 /home/deploy/cjapay/.env
fi

if [ -f /home/deploy/cjapay/logs/audit.log ]; then
  sudo chown deploy:deploy /home/deploy/cjapay/logs/audit.log
  sudo chmod 640 /home/deploy/cjapay/logs/audit.log
fi

echo "✅ Deploy user setup complete."
