docker-php-nginx
================

A Docker build that spins up a php/nginx instance with some support for non-LXC hosts.

Disclaimer: This box is extremely alpha at the moment.

## Requirements
- [Vagrant >= 1.6.2](https://www.vagrantup.com/downloads.html)
- [Docker >= 0.10.0](https://www.docker.io/)
- [VirtualBox >= 4.3.10](https://www.virtualbox.org/wiki/Downloads)


## Basic Instructions

#### Docker (If you do not have Docker, go to the [Vagrant](https://github.com/pemcconnell/docker-php-nginx/tree/develop#vagrant-docker-users-can-ignore-this) section)

Note: this assumes you are familiar with [Docker](https://www.docker.io/). Also, docker users can just choose to follow the vagrant steps instead if desired.

1. From this directory root, run `sudo docker build -t="dockerphpnginx" .`. This may take a while. In this example we have tagged the box as 'dockerphpnginx', you can name this to whatever you like.
2. Confirm the your image completed successfully by running `sudo docker images` and checking 'dockerphpnginx' is in the list displayed.
3. Start your instance with `sudo docker run -P -v=/home/myusername/Sites/mydockerproject/app/:/var/www/app:rw  -d dockerphpnginx`. Note: replace '/home/myusername/Sites/mydockerproject/app/' with the absolute path to your app directory
4. Your docker instance should now be running. You can check this with the following command `sudo docker ps`. 
5. From here (`sudo docker ps`) you should be able to see which host ports are currently bound to the containers. eg. `0.0.0.0:49166->3306/tcp, 0.0.0.0:49167->80/tcp` This means you can access the app on [http://0.0.0.0:49167](http://0.0.0.0:49167). Visit this in your browser to view the sample app.



##'SSH into the box'
Sometimes it's useful to hop in and have a look, which is really simple to do. Simply run `sudo docker run -i -t dockerphpnginx /bin/bash`


##Useful Docker Commands (use with care)

- View docker images
```
sudo docker images
```
- List actively running images (add -l to include stopped containers)
```
sudo docker ps
```
- View container logs
```
sudo docker logs <containerID>
```
- Stop container
```
sudo docker stop <containerID>
```
- Delete dead images 
```
for i in `sudo docker images|grep \<none\>|awk '{print $3}'`;do sudo docker rmi $i;done
```
- Delete containers 
```
sudo docker rm -f `sudo docker ps --no-trunc -a -q`
```
