FROM node:12.9.0-alpine as build
WORKDIR /usr/src/app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
RUN npm install -g --silent
RUN npm install react-scripts@3.1.1 -g --silent
COPY . ./
RUN npm run build

# production environment
FROM nginx:1.16.0-alpine
COPY --from=build /usr/src/app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
