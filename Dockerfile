FROM ubuntu:14.04
MAINTAINER Shaker Qawasmi - github.com/sqawasmi 
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN echo deb http://nightly.odoo.com/7.0/nightly/deb/ ./ > /etc/apt/sources.list.d/openerp-70.list

# Configure locale
RUN export LANGUAGE=en_US.UTF-8 && \
	export LANG=en_US.UTF-8 && \
	export LC_ALL=en_US.UTF-8 && \
	locale-gen en_US.UTF-8 && \
	dpkg-reconfigure --frontend noninteractive locales

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install --allow-unauthenticated -y openssh-server supervisor openerp

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

RUN echo 'root:odoo' |chpasswd

ADD openerp-server.conf /etc/openerp/openerp-server.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 8069
CMD ["/usr/bin/supervisord"]
