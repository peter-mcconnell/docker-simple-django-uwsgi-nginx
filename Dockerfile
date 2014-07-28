FROM ubuntu:14.04
MAINTAINER Peter McConnell <peter.mcconnell@rehabstudio.com>

# keep upstart quiet
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# no tty
ENV DEBIAN_FRONTEND noninteractive

# Get up to date
RUN apt-get update --fix-missing

# Installs
RUN apt-get install -y build-essential git 
RUN apt-get install -y python python-dev python-setuptools
RUN apt-get install -y nginx supervisor
RUN easy_install supervisor 
RUN easy_install supervisor-stdout 
RUN easy_install pip
RUN pip install uwsgi

# nginx config
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# file management
ADD ./ops /ops
ADD ./app /var/www/app
RUN ln -s /ops/supervisord.conf /etc/supervisord.conf
RUN rm /etc/nginx/sites-available/default && ln -sf /ops/vhost.conf /etc/nginx/sites-enabled/default
RUN chown -R www-data /var/www/app

# rev er up
RUN chmod +x /ops/run.sh

CMD /ops/run.sh

# expose port(s)
EXPOSE 80
