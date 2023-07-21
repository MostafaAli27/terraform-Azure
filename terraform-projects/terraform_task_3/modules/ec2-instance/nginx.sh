#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo cat > /etc/nginx/sites-enabled/default << EOL
server {
    listen 80 default_server;
    location / {
    proxy_pass http://${var.lb_ip};
    }
}

EOL
sudo systemctl restart nginx
