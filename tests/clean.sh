#!/bin/bash

# Colores
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # Sin color

image_name=img-test
container_name=cont-test
hostname=cueva
echo -n "---- CLEANING: "
docker rm -f $(docker ps -aq) 2>/dev/null && echo -e "${GREEN}Contenedores eliminados${NC}" || echo -e "${RED}No había contenedores que borrar${NC}"
docker rmi $(docker images -q) 2>/dev/null && echo -e "${GREEN}Imagenes eliminadas${NC}" || echo -e "${RED}No había imagenes que borrar${NC}"
docker volume prune -f
echo "---- BUILDING: "
docker build -t $image_name . && echo -e "${GREEN}Imagen montada${NC}" || echo -e "${RED}La imagen no ha podido ser creada${NC}"
echo "---- RUNNING: "
docker run -p 4242:4242 -d -v /workspaces/Inception/tests/compartido:/compartido --name $container_name --hostname $hostname $image_name || echo "${RED}El contenedor no ha podido desplegarse${NC}"

docker exec -it $container_name /bin/bash


# DOCKER RUN:
# -p HOST:CONTAINER (port binding) para mapear un puerto del host al contenedor
# -d (detach) para que el contenedor corra en segundo plano
# -v HOST:CONTAINER (bind mount) para montar un directorio del host en el contenedor
# --name nombre del contenedor
# --hostname nombre del host