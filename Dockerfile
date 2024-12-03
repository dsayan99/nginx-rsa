# Base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Generate RSA private key and self-signed certificate
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key \
    -out /etc/nginx/ssl/server.crt -nodes -days 365 \
    -subj "/CN=localhost"

# Configure Nginx for TLS
RUN echo '\
server {\n\
    listen 443 ssl;\n\
    server_name localhost;\n\
\n\
    ssl_certificate /etc/nginx/ssl/server.crt;\n\
    ssl_certificate_key /etc/nginx/ssl/server.key;\n\
\n\
    ssl_protocols TLSv1.2 TLSv1.3;\n\
    ssl_prefer_server_ciphers on;\n\
    ssl_ciphers "ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384";\n\
    ssl_ecdh_curve X25519:P-256:P-384:P-521;\n\
\n\
    location / {\n\
        root /usr/share/nginx/html;\n\
        index index.html;\n\
    }\n\
}\n' > /etc/nginx/sites-available/default

# Expose port 443 for HTTPS
EXPOSE 443

# Start Nginx
# CMD ["nginx", "-g", "daemon off;"]
CMD ["bash"]
