FROM node:8

LABEL maintainer="Inventive Group Inc."

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

COPY . .

CMD [ "npm", "test" ]