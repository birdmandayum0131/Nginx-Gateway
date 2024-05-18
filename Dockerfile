FROM nginx:latest
LABEL author="Bird"
COPY ${SSL_CERT_PATH} /etc/nginx/ssl/live
# create user:password for https access
RUN apt update && apt install -y apache2-utils
RUN mkdir /etc/apache2 && \
    echo ${HTTP_PASSWORD} | htpasswd -c -i /etc/apache2/.htpasswd ${HTTP_USER}
EXPOSE 80 443