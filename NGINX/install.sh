apt install nginx certbot python3-certbot-nginx libnginx-mod-stream python3-certbot-dns-cloudflare

https://github.com/pietro1796/HOMELAB/blob/main/NGINX/Config%20new%20site

nano /etc/nginx/ssl/cloudflare.ini ( METTERE TOKEN API)
dns_cloudflare_api_token = XXXXX

--
tunnel: a7ce74cf-d70a-48ab-a65f-bbeb7c52a0eb
credentials-file: /root/.cloudflared/a7ce74cf-d70a-48ab-a65f-bbeb7c52a0eb.json
  #ACCESSO
ingress:
  - hostname: "*.pietrohome.it"
    service: https://127.0.0.1:443
    originServerName: pietrohome.it
    originRequest:
      noTLSVerify: true
  - service: http_status:404
--

chmod 600 /etc/nginx/ssl/cloudflare.ini
cloudflared service install

certbot certonly  --dns-cloudflare --dns-cloudflare-credentials /etc/nginx/ssl/cloudflare.ini -d '*.stacknet.it' -d stacknet.it --agree-tos --no-eff-email --email p.gano96@gmail.com
ln -s /etc/letsencrypt/live/stacknet.it/fullchain.pem /etc/nginx/ssl/stacknet.pem
ln -s /etc/letsencrypt/live/stacknet.it/privkey.pem /etc/nginx/ssl/stacknet.key
