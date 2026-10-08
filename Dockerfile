FROM node:20-alpine

ENV MONGO_USER='admin' \
    MONGO_PASS='' \
    MONGO_HOST='' \
    MONGO_PORT=27017 \
    APP_HOST='' \
    PORT=3000

WORKDIR /home/app

COPY ./app/package*.json ./
RUN npm ci --omit=dev

COPY ./app .
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
CMD ["node", "server.js"]
