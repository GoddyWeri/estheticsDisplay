
# Stage 1: Build dependencies
#FROM node:14 as builder
#WORKDIR /usr/src/app
#COPY package*.json ./
#RUN npm install

#build project
#WORKDIR /usr/src/app
#COPY --from=builder /usr/src/app .
#COPY ./src ./src
#COPY ./angular.json ./tsconfig.json ./tsconfig.app.json ./
#RUN npm run lint -- --fix

#ARG environment=pro

#COPY ./nginx.conf /etc/nginx/nginx.conf
#COPY ./default.conf /etc/nginx/conf.d/default.conf
#RUN npm run build
#EXPOSE 3000
#CMD ["npm", "start"]

#Stage 1: Build dependencies
#FROM node:14 as builder
#WORKDIR /usr/src/app
#COPY package*.json ./
#RUN npm install

# Build project
#COPY ./src ./src
#COPY ./angular.json ./tsconfig.json ./tsconfig.app.json ./
##RUN npm run lint -- --fix

#Stage 2: Build the final image
#FROM nginx:stable-alpine
#COPY ./nginx.conf /etc/nginx/nginx.conf
#COPY ./default.conf /etc/nginx/conf.d/default.conf

#Copy built files from the builder stage
##COPY --from=builder /usr/src/app /usr/share/nginx/html

#RUN npm run build
#EXPOSE 3000
#CMD ["npm", "start"]

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
