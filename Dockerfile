FROM node:8

LABEL maintainer="Inventive Group Inc."

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install --only=production

COPY ./src ./src

EXPOSE 8080

CMD [ "npm", "start" ]