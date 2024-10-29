#!/bin/bash

image_name=img-test
container_name=cont-test
hostname=cueva
docker rm -f $(docker ps -aq) >/dev/null && echo "Contenedores parados y eliminados" || echo "No había contenedores que borrar"
docker rmi $(docker images -q) >/dev/null && echo "Imagenes eliminadas" || echo "No había imagenes que borrar"
docker volume prune -f

docker build -t $image_name . >/dev/null && echo "Imagen montada" || echo "La imagen no ha podido ser creada"
docker run -d -v /workspaces/Inception/tests/compartido:/compartido --name $container_name --hostname $hostname $image_name && echo "Contenedor corriendo" || echo "El contenedor no ha podido desplegarse"

docker exec -it $container_name /bin/bash