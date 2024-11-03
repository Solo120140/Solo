### Base
FROM node:20-alpine as base
ENV NODE_ENV=some_env

# Install necessary packages for Puppeteer
# Installs latest Chromium (100) package.
RUN apk add --no-cache \
    udev \
    ttf-freefont \
    chromium

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

USER username
WORKDIR /usr/src/app

# Copy base dependencies describing
COPY package*.json ./

RUN npm install


### Builder
FROM base as builder

RUN npm install 
RUN npm run build


### Runtime
FROM node:20-alpine as runtime
ENV NODE_ENV=some_env
WORKDIR /your_work_dir

# Install necessary packages for Puppeteer in runtime image
RUN apk add --no-cache \
    udev \
    ttf-freefont \
    chromium

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser


# Copy runtime dependencies
# COPY ...

CMD ["npm", "run", "start:prod"]
