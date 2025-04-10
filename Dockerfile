FROM --platform=linux/arm64 node:14
MAINTAINER Jatin Shridhar <shridhar.jatin@gmail.com>

# install deps
ADD package.json /tmp/package.json
RUN cd /tmp && npm install

# Copy deps
RUN mkdir -p /opt/hello-world-app && cp -a /tmp/node_modules /opt/hello-world-app

# Setup workdir
WORKDIR /opt/hello-world-app
COPY . /opt/hello-world-app

# run
EXPOSE 3000
CMD ["npm", "start"]
