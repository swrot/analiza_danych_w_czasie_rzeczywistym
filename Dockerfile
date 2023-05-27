# Użyj obrazu bazowego Python 3.9
FROM python:3.9

# Ustaw katalog roboczy na /app
WORKDIR /app

# Skopiuj plik requirements.txt do katalogu /app
COPY requirements.txt .

# Zainstaluj zależności aplikacji
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj plik app.py do katalogu /app
COPY app.py .

# Uruchom aplikację Flask na porcie 5000
EXPOSE 5000

# Uruchom aplikację po starcie kontenera
CMD ["python", "app.py"]