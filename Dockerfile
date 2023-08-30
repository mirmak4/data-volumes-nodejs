# use nodejs version 14 as environment
FROM node:14

# create container main dir
WORKDIR /app

# copy package json file into WORKDIR
COPY package.json .

# install all dependencies from package json
RUN npm install

# copy the rest of the files from root directory into WORKDIR
COPY . .

# expose default http 80 port for our web app
EXPOSE 80

# start our app
CMD [ "node", "server.js"]