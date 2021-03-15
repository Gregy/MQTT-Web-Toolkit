FROM node:latest as builder
COPY . /build
WORKDIR /build
RUN yarn install
RUN yarn build

FROM nginx:latest
COPY --from=builder /build/dist /usr/share/nginx/html/
