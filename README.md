# nginx-rsa
A nginx demo server on loaclhost.

docker build -t nginx-rsa .

This will open the terminal inside the container.

Within the terminal, type 
nginx -g "daemon off;"

The server will start on port 443.

To edit the port and the server configuration navigate to /etc/nginx/nginx.conf and change the code for HTTPS Server.