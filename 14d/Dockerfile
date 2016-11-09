FROM ubuntu:14.04
MAINTAINER setup1

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y openssh-server
RUN echo 'root:32886/rzw' |chpasswd
RUN mkdir /var/run/sshd
RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.b 
RUN echo 'PermitRootLogin yes' > /etc/ssh/sshd_config

RUN apt-get install -y python-setuptools
RUN apt-get install -y python-imaging
RUN apt-get install -y sqlite3
RUN mkdir /home/seafile
RUN wget -P /home/seafile http://download-cn.seafile.com/seafile-server_6.0.5_x86-64.tar.gz
RUN tar -xzf /home/seafile/seafile-server_6.0.5_x86-64.tar.gz

EXPOSE 22
EXPOSE 8000
EXPOSE 8082
ENTRYPOINT /usr/sbin/sshd -D
