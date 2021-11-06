FROM ubuntu

WORKDIR /usr/src/codinStruct
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y git

COPY package*.json ./
RUN npm install

COPY md2html/requirements.txt md2html/
RUN pip3 install -r md2html/requirements.txt

COPY . .

# Saves the built files to the image so they don't have to be built again
RUN npm run build

EXPOSE 80
CMD ["npm","start"]
