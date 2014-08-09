FROM ubuntu:14.04
MAINTAINER Shaker Qawasmi - github.com/sqawasmi 
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN echo deb http://nightly.odoo.com/trunk/nightly/deb/ ./ > /etc/apt/sources.list.d/openerp-80.list

# Configure locale
RUN locale-gen en_US.UTF-8 && update-locale
RUN echo 'LANG="en_US.UTF-8"' > /etc/default/locale

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install --allow-unauthenticated -y openssh-server supervisor python-pybabel python-pydot graphviz python-matplotlib postgresql-client openerp

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN mkdir /home/openerp
RUN chown openerp:openerp /home/openerp

RUN echo 'root:odoo' |chpasswd

ADD files/openerp-server.conf /etc/openerp/openerp-server.conf
ADD files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/etc/openerp"]

EXPOSE 22 8069
CMD ["/usr/bin/supervisord"]
