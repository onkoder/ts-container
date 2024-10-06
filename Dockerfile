FROM node:lts-alpine AS builder
WORKDIR /usr/app
ARG PORT=3000
ENV PORT=${PORT}
COPY package*.json .
RUN npm ci
COPY . .

EXPOSE $PORT

FROM builder AS development

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

CMD [ "npm", "run", "dev" ]

FROM builder AS production
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

CMD [ "npm", "run", "build" ]
