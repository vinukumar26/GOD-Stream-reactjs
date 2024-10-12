FROM node:18-alpine
WORKDIR /app
COPY GOD-Stream/package.json GOD-Stream/package-lock.json ./
RUN npm install
COPY GOD-Stream/ ./
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]                                                                                                                                                          
