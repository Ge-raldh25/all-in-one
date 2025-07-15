# Image de base
FROM python:3.11-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app.py .

# Exposer le port
EXPOSE 5000

# Commande pour démarrer l'app
CMD ["python", "app.py"]
