# Install NGINX

```
brew install nginx
```

# Start

```
sudo brew services start nginx
```

# Configuration

We want to store our web site in the folder of our choice, and access to the URL `http://localhost/`. To do this, edit the configuration file :  `nano /usr/local/etc/nginx/nginx.conf`

```
user <user> staff;
server {
  listen 80;
  server_name localhost;
  root /Users/<user>/Documents/path/to/your/website;
  index index.html index.htm;
}
```

Then, restart :  `sudo brew services restart nginx`

