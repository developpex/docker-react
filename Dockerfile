# Stage 1: Build the application
FROM node:lts-alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the application with nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
