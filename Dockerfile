# Utiliser une image légère de Python 3.11
FROM python:3.11-slim

# Empêche Python de générer des fichiers .pyc
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Créer et utiliser un utilisateur non-root pour plus de sécurité
RUN adduser --disabled-password --gecos '' appuser
USER appuser

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires
COPY --chown=appuser:appuser requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du code
COPY --chown=appuser:appuser . .

# Exposer le port sur lequel l'app écoute (à ajuster selon ton app)
EXPOSE 5000

# Lancer l'application
CMD ["python", "app.py"] 
