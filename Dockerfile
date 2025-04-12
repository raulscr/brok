# Use Debian/Ubuntu base image
FROM frolvlad/alpine-glibc:latest as build

# Informações básicas
LABEL maintainer="Davi A. Wasserberg <davi.abreu.w@gmail.com>"
LABEL description="Servidor rAthena emulador para Ragnarok Online baseado em Debian"

# Atualizar e instalar dependências
RUN apk add --no-cache gcc g++ make cmake build-base linux-headers glibc libstdc++ libgcc zlib-dev mariadb-dev

# Clonar rAthena
RUN git clone https://github.com/rathena/rathena.git /build/rathena

# Compilar o emulador
WORKDIR /build/rathena

RUN ./configure --enable-packetver=20131223
# TODO: add cmake build, ccache and job (-jN)
RUN make clean server

FROM frolvlad/alpine-glibc:latest AS rathena

RUN apk add --no-cache glibc libstdc++ libgcc zlib-dev mariadb-dev ca-certificates linux-headers procps

# copy db and config files
# we can use our own files instead of rathena project default
COPY --from=build /build/rathena/db /opt/rathena/db
COPY --from=build /build/rathena/npc /opt/rathena/npc
COPY rathena-conf /opt/rathena/conf/

# copy built binaries and startup scripts
COPY --from=build /build/rathena/function.sh /opt/rathena/function.sh
COPY --from=build /build/rathena/athena-start /opt/rathena/athena-start
COPY --from=build /build/rathena/login-server /opt/rathena/login-server
COPY --from=build /build/rathena/char-server /opt/rathena/char-server
COPY --from=build /build/rathena/map-server /opt/rathena/map-server
COPY --from=build /build/rathena/web-server /opt/rathena/web-server

WORKDIR /opt/rathena

# Porta padrão do emulador (modifique conforme necessário)
EXPOSE 5121 6121 6900

# Script de entrada (iniciar o emulador)
ENTRYPOINT [ "./athena-start" ]
CMD [ "watch" ]