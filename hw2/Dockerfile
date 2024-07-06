# Використовуємо офіційний образ Python 3.10
FROM python:3.10-slim

# Встановлюємо необхідні системні залежності
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Копіюємо файл з вимогами до контейнера
COPY requirements.txt .

# Встановлюємо залежності з requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо поточну директорію в контейнер за шляхом /app
COPY . .

# Відкриваємо порт 8000 для доступу ззовні
EXPOSE 8000

# Запускаємо застосунок
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
