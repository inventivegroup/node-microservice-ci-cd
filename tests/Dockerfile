FROM node:8

LABEL maintainer="Inventive Group Inc."

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

CMD [ "npm", "test" ]