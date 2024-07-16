# Stage 1: Build the client application
FROM node:14 as frontend-build

#Author
LABEL maintainer="Nice Mauko"

WORKDIR /client/app

COPY /package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the client application using Nginx
FROM nginx:alpine

COPY --from=frontend-build /client/app/build /usr/share/nginx/html

EXPOSE 80