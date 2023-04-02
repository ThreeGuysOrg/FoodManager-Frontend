##### Build stage #####
FROM node:lts AS build
WORKDIR /app
COPY /food-manager/package*.json ./
RUN npm ci
COPY . .
RUN npm run build


##### Ready to start app #####
FROM node:lts
WORKDIR /app
COPY --from=build /app ./
ENV PORT=8080
EXPOSE 80 443
