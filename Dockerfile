FROM nginx:1.21.6

COPY conf.template /etc/nginx/conf.d/conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types
COPY static-html /usr/share/nginx/html


CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
