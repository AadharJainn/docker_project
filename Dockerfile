FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD ["npm","run","build"]

FROM nginx:latest 
COPY --from=builder /app/build /usr/share/nginx/html
#Nginx will by default run the start command

