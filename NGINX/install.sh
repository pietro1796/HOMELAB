apt install nginx certbot python3-certbot-nginx

touch /etc/nginx/ssl/cloudflare.ini
echo "dns_cloudflare_api_token = sguj4KHrOUCz9tjrZfVr3XfryTQPZP2rrKn8pDKu"
chmod 600 /etc/nginx/ssl/cloudflare.ini

certbot certonly  --dns-cloudflare --dns-cloudflare-credentials /etc/nginx/ssl/cloudflare.ini -d '*.pietrohome.it' -d pietrohome.it --agree-tos --no-eff-email --email p.gano96@gmail.com
ln -s /etc/letsencrypt/live/pietrohome.it/fullchain.pem /etc/nginx/ssl/pietrohome.pem
ln -s /etc/letsencrypt/live/pietrohome.it/privkey.pem /etc/nginx/ssl/pietrohome.key
