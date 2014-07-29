docker-django-uwsgi-nginx
=========================

A Docker build that 'spins up' a python/uwsgi/nginx container.

Disclaimer: This container is yet to be production tested.

## Requirements
- [Docker >= 0.10.0](https://www.docker.io/)


## Basic Instructions

#### Docker

Note: this assumes you are familiar with [Docker](https://www.docker.io/)

1. From this directory root, run `sudo docker build -t="docker-uwsgi-nginx" .`. This may take a while. In this example we have tagged the container as 'docker-uwsgi-nginx', you can name this to whatever you like.
2. Confirm the your image completed successfully by running `sudo docker images` and checking 'docker-uwsgi-nginx' is in the list displayed.
3. Start your container with `sudo docker run -P -v=/home/myusername/Sites/mydockerproject/app/:/var/www/app:rw  -d docker-uwsgi-nginx`. Note: replace '/home/myusername/Sites/mydockerproject/app/' with the absolute path to your app directory
4. Your docker container should now be running. You can check this with the following command `sudo docker ps` - take note of your port numbers here for the next step. The first column in this list will be the Container ID - you can monitor the progress of your container by typing `sudo docker logs -f 6cdc7a0aee7e` where `6cdc7a0aee7e` is replaced with your Container ID. `Ctrl C` will exit you out of this log view.
5. From here (`sudo docker ps`) you should be able to see which host ports are currently bound to the containers. eg. `0.0.0.0:49167->80/tcp` This means you can access the app on [http://0.0.0.0:49167](http://0.0.0.0:49167). Visit this in your browser to view the sample app.


##'SSH into the box'
Sometimes it's useful to hop in and have a look, which is really simple to do. Simply run `sudo docker run -i -t docker-uwsgi-nginx /bin/bash`.
*Note:* you should realise that this will create a new container and present you with a running bash, and that you aren't infact 'sshing into a box'.


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
sudo docker logs -f <containerID>
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
