# Nginx Dockerfile
# Pull base image.
FROM ubuntu:latest

# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

RUN rm /etc/nginx/sites-enabled/default
COPY index.html /var/www/html
COPY default /etc/nginx/conf.d/default.conf


#working directory.
WORKDIR /etc/nginx

# Command.
CMD ["nginx"]

# Expose ports
EXPOSE 80
EXPOSE 443
