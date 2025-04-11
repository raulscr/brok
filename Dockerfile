# Use Debian/Ubuntu base image
FROM ubuntu:20.04

# Informações básicas
LABEL maintainer="Davi A. Wasserberg <davi.abreu.w@gmail.com>"
LABEL description="Servidor rAthena emulador para Ragnarok Online baseado em Debian"

# Variáveis de ambiente
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar e instalar dependências
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    make \
    libmariadbclient-dev \
    libmariadb-dev \
    libmariadbclient-dev-compat \
    zlib1g-dev \
    libpcre3-dev \
    libssl-dev \
    gcc \
    g++ \
    cmake \
    nano \
    tmux \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Clonar rAthena
RUN git clone https://github.com/rathena/rathena.git /opt/rathena
# COPY ./rathena /opt/rathena

# Remove configurações legadas
RUN rm -rf /opt/rathena/conf/*

# Copia configurações locais
COPY ./rathena-conf/ /opt/rathena/conf/

# Compilar o emulador
WORKDIR /opt/rathena

RUN ./configure --enable-packetver=20131223 && make -j4 server

# Porta padrão do emulador (modifique conforme necessário)
EXPOSE 5121 6121 6900

# Script de entrada (iniciar o emulador)
CMD ["/opt/rathena/athena-start", "start"]