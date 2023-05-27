FROM jupyter/pyspark-notebook

WORKDIR /home/jovyan/notebooks

USER root

RUN apt-get update && \
    apt-get install -y curl vim wget git netcat && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN conda install flask numpy --yes

# Skopiuj plik requirements.txt do katalogu
COPY requirements.txt .

# Zainstaluj zależności aplikacji
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj plik app.py do katalogu
COPY app.py .

# Skopiuj plik model.pkl do katalogu
COPY model.pkl .

# Uruchom aplikację Flask na porcie 5000
EXPOSE 5000

USER ${NB_UID}


# Uruchom aplikację po starcie kontenera
CMD ["python", "app.py"]
