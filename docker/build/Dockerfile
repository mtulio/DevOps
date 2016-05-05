FROM centos:centos6
MAINTAINER MTulio <admin@mtulio.eng.br>

#RUN yum -y update; yum clean all

# Replace fake systemd with real systemd
# Lifted from http://jperrin.github.io/centos/2014/09/25/centos-docker-and-systemd/
RUN yum -y remove fakesystemd
RUN yum -y install systemd systemd-libs initscripts
RUN yum -y update; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install SSH and config user
RUN yum -y install openssh-server openssh-clients
RUN yum -y install sudo
RUN useradd --create-home -s /bin/bash docker
RUN echo -n 'docker:docker' | chpasswd
RUN echo 'docker ALL = NOPASSWD: ALL' > /etc/sudoers.d/docker
RUN chmod 440 /etc/sudoers.d/docker

# Install apache
RUN yum -y install httpd
RUN echo "This is our new Apache Test Site" >> /var/www/html/index.html

EXPOSE 80

# Just run docker using /sbin/init
#RUN echo "/sbin/service httpd start" >> /root/.bashrc
#RUN echo "/sbin/service sshd start" >> /root/.bashrc
