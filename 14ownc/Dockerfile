FROM ubuntu:14.04
MAINTAINER setup1

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y openssh-server
RUN echo 'root:32886/rzw' |chpasswd
RUN mkdir /var/run/sshd
RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.b 
RUN echo 'PermitRootLogin yes' > /etc/ssh/sshd_config

RUN apt-get install -y apache2
RUN apt-get install -y php5
#RUN apt-get install -y mysql-server
RUN apt-get install -y sqlite

RUN mkdir /home/v
RUN wget -P /home/v https://download.owncloud.org/download/repositories/stable/Ubuntu_14.04/Release.key
RUN apt-key add - < /home/v/Release.key
RUN rm -R /home/v
RUN sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Ubuntu_14.04/ /' > /etc/apt/sources.list.d/owncloud.list"
RUN apt-get update
RUN apt-get install -y owncloud

EXPOSE 80
ENTRYPOINT /usr/sbin/sshd -D
