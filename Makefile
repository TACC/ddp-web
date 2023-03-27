nginx_edit:
	sudo vim /etc/nginx/sites-available/ddp.conf

nginx_reload:
	sudo nginx -t && sudo nginx -s reload

nginx_restart:
	sudo systemctl restart nginx

nginx_status:
	service nginx status
