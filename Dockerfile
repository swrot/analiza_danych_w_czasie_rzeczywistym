FROM jupyter/pyspark-notebook

USER root

RUN apt-get update && \
    apt-get install -y curl vim wget git netcat && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN conda install --no-cache tensorflow pymongo flask numpy pandas matplotlib --yes

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

USER ${NB_UID}

WORKDIR /home/jovyan/notebooks
