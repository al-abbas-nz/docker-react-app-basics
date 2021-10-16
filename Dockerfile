FROM node:14.16.0-alpine3.13
WORKDIR /app/
# chown -R change the owner of app folder to app
# the node_modules will be owned by app too
RUN addgroup app && adduser -S -G app app && chown -R app /app
USER app
# When using COPY with more than one source file, the destination must be a directory and end with a /
COPY package*.json ./
RUN npm i
# When using COPY with more than one source file, the destination must be a directory and end with a /
COPY . ./
ENV API_URL=http://api.app.test
EXPOSE 3000
CMD [ "npm", "start" ]