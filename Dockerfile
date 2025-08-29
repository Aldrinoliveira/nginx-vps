FROM nginx:alpine

# Instalar OpenSSL para certificados
RUN apk add --no-cache openssl

# Copiar configuração do Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Script para criar certificados SSL
COPY ssl-setup.sh /ssl-setup.sh
RUN chmod +x /ssl-setup.sh

# Criar diretório SSL
RUN mkdir -p /etc/nginx/ssl

# Expor portas
EXPOSE 80 443

# Script de inicialização
CMD ["/bin/sh", "-c", "/ssl-setup.sh && nginx -g 'daemon off;'"]
