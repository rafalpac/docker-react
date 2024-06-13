# Build phase
FROM node:20-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install -g npm@latest

COPY . .

RUN npm run build

# Run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# Default command from nginx container will start nginx for us.



