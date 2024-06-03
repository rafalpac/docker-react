# Build phase
FROM node:20-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# Default command from nginx container will start nginx for us.



