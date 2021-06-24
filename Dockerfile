# Partimos de una base oficial de python
FROM ubuntu

RUN apt update 
RUN apt upgrade -y
RUN apt-get install -y dnsutils

# El directorio de trabajo es desde donde se ejecuta el contenedor al iniciarse
WORKDIR /app

# Copiamos todos los archivos del build context al directorio /app del contenedor
ADD domains.txt /

# Ejecuta nuestra aplicación cuando se inicia el contenedor

RUN dig +noall +answer -f  /domains.txt >> /output.txt

RUN apt-get purge -y dnsutils