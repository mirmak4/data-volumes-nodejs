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

# path inside container which should be mapped to path outside container (HOST)
# so that this data can hopefully survive shutdown / deletion of container :)
#
# this creates anonymous volume - which we dont want here, 
# since it will get recreated each time our container is restarted
#
# instead we should use -v option for named volume when we start our image
# VOLUME [ "/app/feedback" ]

# start our app
CMD [ "node", "server.js"]