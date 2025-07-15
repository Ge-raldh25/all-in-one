FROM python:3.11-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier des dépendances
COPY requirements.txt .

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code source
COPY app.py .

# Exposer le port sur lequel l'app écoute
EXPOSE 5000

# Lancer l'application
CMD ["python", "app.py"]
