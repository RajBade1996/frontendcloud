FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN ["npm", "run", "build"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#docker run -p 8080:80 RajBade1996/reactwebprod:latest "80" is default host for nginx.
# default comand for nginx image will automatically start our app on its server so no need to add it here.
