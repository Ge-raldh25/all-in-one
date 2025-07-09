# Utiliser une image légère Nginx
FROM nginx:alpine

# Copier ton fichier HTML dans le dossier web par défaut
COPY Citation.html /usr/share/nginx/html/index.html 

# Exposer le port 85 (interne)
EXPOSE 80
