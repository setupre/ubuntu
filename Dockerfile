FROM ubuntu:f1
MAINTAINER setup1

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y openssh-server
RUN echo 'root:32886/rzw' |chpasswd
RUN mkdir /var/run/sshd
RUN cp /etc/ssh/sshd_config /etc/ssh/sshd_config.b 
RUN echo 'PermitRootLogin yes' > /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"] 
