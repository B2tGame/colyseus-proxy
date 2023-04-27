FROM node:16-alpine

ENV PORT 8080
ENV REDIS_URL redis://onmo-glass-v2-ro.ducrgo.ng.0001.use1.cache.amazonaws.com:6379

WORKDIR /usr/src/app

# Install pm2
RUN npm install pm2 -g

RUN pm2 install typescript

COPY . .

RUN npm install

RUN npx tsc

EXPOSE 8080

CMD [ "npm", "run", "start"]