# Используем образ линукс Alphine с версией node 14
FROM node:19.5.0-alpine

# Указываем рабочую директорию
WORKDIR /app/shit-post

# Скопировать .json и package
COPY package*.json ./

#Установка зависимостей
RUN npm install

# Копируем остальное
COPY . .

# Установить prisma
RUN npm install -g prisma

# Генерируем Prisma client
RUN prisma generate

# Копируем Prisma schema 
COPY prisma/schema.prisma ./prisma/

# Открыть порт в контейнере
EXPOSE 3000

# Заппускаем сервер
CMD [ "npm", "start" ]

