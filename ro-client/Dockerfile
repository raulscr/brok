# Stage 1: Clone the repo
FROM alpine:latest as builder

RUN apk add --no-cache git

# Clona o projeto
RUN git clone https://github.com/vthibault/roBrowser.git /tmp/roBrowser

# Stage 2: Nginx for serving static files
FROM nginx:alpine

LABEL maintainer="Davi A. Wasserberg <davi.abreu.w@gmail.com>"
LABEL description="Cliente Ragnarok Online usando roBrowser (WebGL) com nginx"

# Copy only need input
COPY --from=builder /tmp/roBrowser/applications/window.html /usr/share/nginx/html/index.html

# Copy entire repo contents to nginx public dir
COPY --from=builder /tmp/roBrowser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
