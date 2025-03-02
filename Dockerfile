FROM node:20

EXPOSE 3000/tcp

WORKDIR /usr/src/codinStruct
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

COPY package*.json ./
RUN npm install

COPY . .

# Saves the built files to the image so they don't have to be built again
# every time Heroku stops the app because it was idle and has to start it again
RUN npm run build:prod

CMD ["npm","start"]
