FROM centos:7

RUN  cd /etc/yum.repos.d/
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
#RUN  yum -y update
RUN  yum -y install httpd 
RUN  yum -y install epel-release
#RUN  yum -y install dnf
#RUN  dnf -y update
#RUN  yum -y zip unzip
#RUN yum install -y dnf
RUN yum -y install zip unzip

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

WORKDIR /var/www/html/
#this is the comment line
RUN unzip phtotogenic.zip
RUN cp -rvf phtotogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/bin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22

