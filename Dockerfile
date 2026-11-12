FROM nginx:alpine

LABEL org.opencontainers.image.title="My Dev Workspace"

COPY site/ /usr/share/nginx/html/

EXPOSE 80
