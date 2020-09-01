FROM httpd:2.4.41
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y git
RUN echo "This is my GH actions exercise" > /usr/local/apache2/htdocs/index.html