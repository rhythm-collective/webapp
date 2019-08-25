FROM nginx:1.16.0-alpine
# Need to copy the build artifacts into the dockerfile.
COPY /app/build ../build
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
