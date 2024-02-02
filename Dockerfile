# Stage 1: Build dependencies
FROM node:21 as builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install

#build project
FROM node:21
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
COPY ./src ./src
COPY ./angular.json ./tsconfig.json ./tsconfig.app.json ./
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]
