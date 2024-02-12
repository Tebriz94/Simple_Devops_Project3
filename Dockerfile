FROM centos:latest

RUN  yum -y install httpd \
     zip \
     unzip

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

WORKDIR /var/www/html/
#this is the comment line
RUN unzip phtotogenic.zip
RUN cp -rvf phtotogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/bin/httpd", "-D", " FOREGROUND "]
EXPOSE 80 22

