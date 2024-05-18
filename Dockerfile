FROM nginx:latest
LABEL author="Bird"

ARG SSL_CERT_PATH

COPY ${SSL_CERT_PATH} /etc/nginx/ssl/live
# create user:password for https access
RUN apt update && apt install -y apache2-utils

ARG HTTP_USER
ARG HTTP_PASSWORD

RUN mkdir /etc/apache2 && \
    echo ${HTTP_PASSWORD} | htpasswd -c -i /etc/apache2/.htpasswd ${HTTP_USER}
EXPOSE 80 443