FROM node:10-alpine
ENV NODE_ENV "production"
ENV PORT 8079
EXPOSE 8079
RUN addgroup -S circleci && adduser -S -g circleci circleci && mkdir -p /usr/src/app && chown -R circleci:circleci /usr/src/app

# Prepare app directory
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN chown circleci /usr/src/app/yarn.lock

RUN yarn install
RUN cp /usr/src/app/node_modules/newrelic/newrelic.js /usr/src/app

USER circleci
COPY --chown=circleci:circleci . /usr/src/app
RUN node newrelic_setup.js

# Start the app
CMD ["/usr/local/bin/npm", "start"]
