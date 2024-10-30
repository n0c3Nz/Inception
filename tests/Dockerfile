# Usa la imagen base de Debian
FROM debian:latest

# COMO USUARIO ROOT CREAMOS EL VOLUMEN E INTRODUCIMOS UN FICHERO DE PRUEBA // LOS PUNTOS DE MONTAJE PUEDEN SER TAMBIEN DESDE EL HOST Y OTROS DOCKERS
RUN mkdir /compartido
VOLUME /compartido

# Información del autor
LABEL maintainer="hola@example.com"

# CREAR VARIABLE DE ENTORNO
ENV CLAVE=VALOR

# CORRER COMANDOS DE SETUP
RUN apt-get update -y >$HOME/logs-update && \
    apt-get upgrade -y > $HOME/logs-upgrade && \
    apt install netcat-traditional -y > $HOME/logs-nc

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

# EXPONER EL PUERTO 4242 DEL CONTENEDOR PARA QUE SE PUEDA ACCEDER DESDE FUERA
EXPOSE 4242
# Si a la hora de hacer run hacemos port forwarding mejor (-p 4242:4242)
# Mantén el contenedor activo
# CMD ["nc.traditional", "-lvnp", "4242", "-e", "/bin/bash"]
CMD ["tail", "-f", "/dev/null"]
