FROM node:18.20-alpine 

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json .

RUN npm ci --fetch-timeout=600000

COPY . /usr/src/app

RUN npm run build

ENTRYPOINT npm run preview -- --port 3000 --host

# EXPOSE 3000

# WORKDIR /app

# COPY . .

# RUN npm install

# RUN npm run build

# FROM nginx:1.16.0-alpine

# COPY --from=builder /app/dist /usr/share/nginx/html

# RUN rm /etc/nginx/conf.d/default.conf

# COPY deploy/nginx.conf /etc/nginx/conf.d

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]