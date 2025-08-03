FROM node:18
RUN useradd -m frontenduser

WORKDIR /app
COPY . .

RUN npm install && npm run build
RUN chown -R frontenduser /app

USER frontenduser

EXPOSE 3000
CMD ["npx", "serve", "-s", "dist"]
