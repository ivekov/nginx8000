FROM nginx:latest
MAINTAINER Vekov Ivan <i.vekov@v-halla.ru>
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN find /etc/nginx/ -type f -exec sed -i 's/80/8000/g' {} +
RUN mkdir "/usr/share/nginx/html/health/"
RUN echo "{'status':'OK'}" > /usr/share/nginx/html/health/index.html
RUN mkdir "/usr/share/nginx/html/version/"
RUN echo "{'version':'0.1'}" > /usr/share/nginx/html/version/index.html
EXPOSE 8000
CMD ["nginx"]