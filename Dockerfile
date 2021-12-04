# -- --
# -- create container that runs nginx and servers an image
FROM nginx:latest

# -- remove default nginx config
#RUN rm -f /etc/nginx/conf.d/default.conf

# -- copy over nginx config
COPY conf/service-a.conf /etc/nginx/conf.d/service-a.conf

# -- copy image
COPY index.html /usr/share/nginx/html/index.html
COPY ./images/ /usr/share/nginx/html/images/
