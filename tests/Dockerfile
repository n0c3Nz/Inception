# Usa la imagen base de Debian
FROM debian:latest

# COMO USUARIO ROOT CREAMOS EL VOLUMEN E INTRODUCIMOS UN FICHERO DE PRUEBA // LOS PUNTOS DE MONTAJE PUEDEN SER TAMBIEN DESDE EL HOST Y OTROS DOCKERS
RUN mkdir /compartido
VOLUME /compartido
RUN echo "hola2" > /compartido/saludo2

# Información del autor
LABEL maintainer="hola@example.com"

# CREAR VARIABLE DE ENTORNO
ENV CLAVE=VALOR

# CORRER COMANDOS DE SETUP
RUN apt-get update -y && apt-get upgrade -y > $HOME/logs

# CREAR UN USUARIO, SU HOME Y ESTABLECERLO COMO USUARIO POR DEFECTO DEL CONTENEDOR
RUN useradd -m -s /bin/bash DonProgramon
RUN chown -R DonProgramon:DonProgramon /home/DonProgramon

USER DonProgramon

# CREAR EL ESPACIO DE TRABAJO POR DEFECTO
WORKDIR /home/DonProgramon

# COPIAR FICHEROS DEL HOST AL CONTENEDOR
COPY LEEMEbak /root/LEEME1

# CHETAO, DESCOMPRIME, CURLEA Y TE HACE UNAS LENTEJAS DE PUTA MADRE
ADD LEEME.tar.gz /root/CONSEGUIDO

# Mantén el contenedor activo
CMD ["tail", "-f", "/dev/null"]
