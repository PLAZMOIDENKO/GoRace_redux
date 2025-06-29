# Базовый образ
FROM node:20

# Установка рабочей директории
WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY package*.json ./
RUN npm install --production

# Копируем остальной код
COPY . .

# Указываем порт (если используется)
EXPOSE 3000

# Старт
CMD ["node", "server.js"]
