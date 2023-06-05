# Pour builder ou exécuter la doc
FROM python:alpine AS base
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

# Stage to allow init mkdocs project
FROM base as init
CMD ["mkdocs", "new", "example"]

# Stage to dev locally, pas de copy car on bind mount
FROM base as dev
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]

# On build la doc en elle même
FROM base as build
COPY . .
RUN mkdocs build

## Et on place ca dans le container final
#FROM nginx:alpine
#COPY --from=build /app/site /usr/share/nginx/html
