# Use Debian/Ubuntu base image
FROM alpine:latest AS build
ARG packetver

# Informações básicas
LABEL maintainer="Davi A. Wasserberg <davi.abreu.w@gmail.com>"
LABEL description="Servidor rAthena emulador para Ragnarok Online baseado em Debian"

# Atualizar e instalar dependências
RUN apk update && apk add --no-cache \
    build-base \
    linux-headers \
    git \
    make \
    mariadb-dev \
    zlib-dev \
    pcre-dev \
    openssl-dev \
    gcc \
    g++ \
    cmake

# Clonar rAthena
RUN git clone https://github.com/rathena/rathena.git /opt/rathena

# Compilar o emulador
WORKDIR /opt/rathena

RUN ./configure --enable-packetver=${packetver} && make clean && make server

FROM alpine:latest AS rathena

# copy db and config files
# we can use our own files instead of rathena project default
COPY --from=build /opt/rathena/db /opt/rathena/
COPY --from=build /opt/rathena/npc /opt/rathena/
COPY --from=build /opt/rathena/conf /opt/rathena/

# copy built binaries and startup scripts
COPY --from=build /opt/rathena/function.sh /opt/rathena/function.sh
COPY --from=build /opt/rathena/athena-start /opt/rathena/athena-start
COPY --from=build /opt/rathena/login-server /opt/rathena/login-server
COPY --from=build /opt/rathena/char-server /opt/rathena/char-server
COPY --from=build /opt/rathena/map-server /opt/rathena/map-server
COPY --from=build /opt/rathena/web-server /opt/rathena/web-server

WORKDIR /opt/rathena

# Porta padrão do emulador (modifique conforme necessário)
EXPOSE 5121 6121 6900

# Script de entrada (iniciar o emulador)
CMD ["./athena-start", "start"]
