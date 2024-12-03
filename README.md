# nginx-rsa
A nginx demo server on loaclhost.

`docker build -t nginx-rsa .`

This will open the terminal inside the container.

Within the terminal, type `nginx -c /etc/nginx/nginx.conf -g "daemon off;"`

The server will start on port 443.

To edit the port and the server configuration navigate to `/etc/nginx/nginx.conf` and change the code for HTTPS Server. The server needs to be restarted after changing the configruation.

Open the Browser, open `https:localhost:443`.

Right Click -> Inspect -> Security 

The Key Exchange Protocol will be visible.

