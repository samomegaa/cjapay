FROM node:18
RUN useradd -m appuser

WORKDIR /app
COPY . .

RUN npm install
RUN chown -R appuser /app

USER appuser

EXPOSE 5000
CMD ["node", "src/index.js"]
