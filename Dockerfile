FROM nginx:1.17.1-alpine
RUN rm -rf etc/nginx/nginx.conf
COPY nginx.conf etc/nginx/nginx.conf
COPY dist/angular8-crud-demo/ /usr/share/nginx/html/app/
RUN ls /usr/share/nginx/html/app/*
# When the container starts, replace the env.js with values from environment variables
CMD ["/bin/sh",  "-c",  "envsubst < /usr/share/nginx/html/app/assets/env.template.js > /usr/share/nginx/html/app/assets/env.js && exec nginx -g 'daemon off;'"]
EXPOSE 80
