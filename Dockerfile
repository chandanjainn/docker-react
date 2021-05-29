# BUILD Phase
FROM node:14-alpine

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build


# RUN Phase
FROM nginx
EXPOSE 3000
COPY --from=0 /app/build /usr/share/nginx/html