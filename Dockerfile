FROM alpine
ADD docker-registry.conf /docker-registry.conf
ENV UP_PASSWORD test
RUN apk --update add nginx apache2-utils

EXPOSE 80

CMD /bin/sh -c '\
  htpasswd -cb /docker-registry.htpasswd up $UP_PASSWORD; \
  nginx -c /docker-registry.conf'
  
