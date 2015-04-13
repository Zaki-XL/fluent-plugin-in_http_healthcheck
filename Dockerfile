FROM centos:centos6

# Set HOSTNAME
ENV HOSTNAME centos/td_agent

# TimeZone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# Locale
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
RUN sed -ri 's/en_US/ja_JP/' /etc/sysconfig/i18n


# install sudo
RUN yum -y install sudo
# Edit sudoers file
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

# install td-agent lib
RUN yum -y install ncurses readline-devel

# install td-agent2
RUN curl -L http://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
RUN sed -i -e "s/--user td-agent/--user root/g" /etc/init.d/td-agent &&\
    sed -i -e "s/--group td-agent/--user root --group td-agent/g" /etc/init.d/td-agent
RUN ulimit -n 65536

RUN yum -y install gcc-c++

# Deploy td-agent.conf
WORKDIR /etc/td-agent
ADD td-agent.conf td-agent.conf

ADD pkg/ /code

#CMD td-agent -c /etc/td-agent/td-agent.conf -vv
#EXPOSE 24224
