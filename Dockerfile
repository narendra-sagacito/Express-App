FROM node:10-alpine

LABEL maintainer=NARENDRA

RUN apk update && \
  apk --no-cache add bash libc6-compat && \
  addgroup -S docker && adduser -S -G docker docker

COPY ./package.json /app/package.json

WORKDIR /app

RUN npm install && \
  npm cache clean --force

COPY . /app

CMD ["npm", "start"]