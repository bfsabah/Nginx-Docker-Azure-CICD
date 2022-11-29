FROM nginx:latest
WORKDIR /app 
COPY . ./
RUN rm /usr/share/nginx/html/index.html
RUN mv index.html /usr/share/nginx/html
COPY . /usr/share/nginx/html
RUN service nginx restart
ENTRYPOINT ["nginx", "-g", "daemon off;"]