# README

Installation Commands
--------------

__Update Packages__
```
sudo apt update && apt upgrade -y
```

__Install Ruby__
```
sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev curl git nginx -y
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv install 3.1.2
rbenv global 3.1.2
```

__Install Rails & Other Dependencies__
```
gem install rails
apt install yarn
```

__Install App__
```
cd
git clone https://github.com/TACC/ddp-web
cd ddp-web
bundle install
```

__Edit the Nginx config__
```
make nginx_edit
```
Add the following:
```
server {
        listen 80;
        listen [::]:80;

        # Change to drugdiscovery.tacc.utexas.edu
        server_name 129.114.4.222;



        location / {
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $http_host;
                proxy_redirect off;
                proxy_pass http://localhost:3000;
        }
}
```

Starting the Web & App Servers
------------------
```
make nginx_restart
make nginx_reload
make nginx_status
rails s -d &       # Starts the server as a daemon; must be run from inside ~/ddp_lite 
```

Stopping the Web & App Servers
-------------------
Use the following command to find the app server process id:
```
ps -aux | grep puma | awk 'NR==1{{print $2}}'
```

Use the following command to stop the app server (running on port 3000):
```
kill -9 $(lsof -i tcp:3000 -t)
```

User the following command to stop the web server:
```
sudo systemctl stop nginx
```


Editing Web Server Config
-------------
```
make nginx_edit
```

Editing App Pages
--------
- HTML pages are in ddp-web/app/views/pages
- Header/footer are in ddp-web/app/views/shared
- Main HTML metadata is in ddp-web/app/views/layouts/application.html.erb
- CSS is in ddp-web/app/assets/stylesheets/main.css
- Images are in ddp-web/app/assets/images
