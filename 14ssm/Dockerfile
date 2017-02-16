FROM ubuntu:14.04
MAINTAINER setup1

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y openssh-server
RUN echo 'root:32886/rzw' |chpasswd
RUN mkdir /var/run/sshd
RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.b
RUN echo 'PermitRootLogin yes' > /etc/ssh/sshd_config

RUN apt-get install -y python-pip
RUN pip install shadowsocks
RUN wget -P /etc https://raw.githubusercontent.com/setupre/ubuntu/master/14ssm/config.json
#ADD config.json /etc/config.json

#RUN wget https://raw.githubusercontent.com/setupre/ubuntu/master/media/run.sh

EXPOSE 443
EXPOSE 22
EXPOSE 201
EXPOSE 202
EXPOSE 203
ENTRYPOINT ssserver -c /etc/config.json -d start && /usr/sbin/sshd -d
