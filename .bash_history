passwd 
exit
lsblk
ls
curl http://localhost
vim vm.tf 
ls
vim wordpress.yml 
ls /var/lib
ls /var/lib | grep my
vim /var/lib/mysql
ls /var/www
mkdir nginx-conf
cd nginx-conf/
vim nginx.conf
ex
exit
ls
docker-compose wordpress.yml 
docker-compose wordpress.yml -d
docker-compose -d wordpress.yml -d
docker-compose -f wordpress.yml -d
docker-compose -f wordpress.yml up -d
curl http://localhost
ls
mkdir wordpress
mv wordpress.yml wordpress
mv nginx-conf/ wordpress/
ls
vm wordpress/
cd wordpress/
ls
vim nginx-conf/nginx.conf 
ls
mv nginx-conf/ nginx/
ls
ls /var/www/html/
vim wordpress.yml 
docker rmi -f mysql:5.7 
docker rmi -f wordpress:latest 
ls
docker-compose wordpress.yml up -d
docker-compose -f wordpress.yml up -d
vim wordpress.yml 
curl localhost
curl http://localhost
ip -c a
ls
vim wordpress.yml 
docker rmi -f mysql:5.7 
docker rmi -f wordpress:latest 
docker rmi -f nginx:latest 
docker rmi -f busybox:latest 
dcoker ps
docker ps
docker stop wordpress
docker stop wordpress-db-1 
docker stop mysql 
docker rm wordpress
docker rm wordpress-db-1 
docker rm wordpress-nginx-1 
docker rm wordpress-wordpress-1 
docker rm mysql 
docker ps
docker-compose wordpress.yml up -d
docker-compose -f wordpress.yml up -d
vim wordpress.yml 
docker compose ps
docker-compose ps
docker compose ps 
ls
vim wordpress.yml 
systemctl start mariadb
dnf install mariadb mariadb-server
dnf isntall httpd
dnf install httpd
y
mysql_secure_installation 
mysql
mysql -uroot -pmasterkey
systemctl start mysql
mysql -u root -p P@ssw0rd
mysql -u root 
mysql -uroot
mysql -u root
systemctl enable --now mariadb
mysql_secure_installation 
mysql -u root
vim wordpress.yml 
mysql -u root
docker-compose -f wordpress.yml restart -d
docker-compose -f wordpress.yml restart 
ls
vim nginx/nginx.conf 
lv /var/www/html/
ls /var/www/html/
vim nginx/nginx.conf 
ls /var/lib/mysql/
cat /var/lib/mysql/wordpress/
cat /var/lib/mysql/wordpress/db.opt 
ls
rm -rf data logs nginx
docker rmi -f *
docker rmi -f mysql:5.7 nginx:latest  wordpress:latest 
docker ps
docker rm -f wordpress-nginx-1 wordpress-wordpress-1  wordpress-db-1
docker ps
vim wordpress.yml 
dnf update
dnf install docker.io
dnf install docker
systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')" /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
vim wordpress.yml 
docker-compose p -d
docker-compose up -d
docker-compose -f wordpress.yml up -d
vim /etc/selinux/config 
setenforce 0
ls
ssh altlinux@192.168.199.129
vim ../vm.tf 
vim public
terraform destroy roy
terraform destroy 
cd ..
terraform destroy 
terraform apply 
vim vm.tf 
terraform apply 
ssh altlinux@192.168.199.74
ssh altlinux@212.233.93.89
terraform destroy 
ls
ls .ssh/
mv .ssh/id_rsa /home/redos/
cp /home/redos/ .ssh/
cp /home/redos/id_rsa .ssh/
ls
vim /etc/ssh/sshd_config
systemctl restart sshd
