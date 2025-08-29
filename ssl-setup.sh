#!/bin/sh

echo "🔒 Setting up SSL certificates..."

# Criar certificado autoassinado se não existir
if [ ! -f /etc/nginx/ssl/cert.pem ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/key.pem \
        -out /etc/nginx/ssl/cert.pem \
        -subj "/C=BR/ST=SP/L=Sao Paulo/O=DynDNS/OU=IT/CN=api.portalhikvision.com.br"
    
    echo "✅ SSL certificate created"
else
    echo "✅ SSL certificate already exists"
fi

# Testar configuração do Nginx
nginx -t

echo "🚀 Nginx ready to start"
