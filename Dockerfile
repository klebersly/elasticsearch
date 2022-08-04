#version 0.01.rc2
#Desenv by Gitlab-CI / User:kleberd / Pipeline:dockerfiles#12
FROM ubuntu:16.04
#Cria usuário e grupo elasticsearch
RUN groupadd -g 1000 elasticsearch && useradd elasticsearch -u 1000 -g 1000
#Especifica pasta de binários do elastic
ENV PATH=$PATH:/elastic/elasticsearch-7.17.5/bin
#Especifica HOME do container
WORKDIR /elastic/
#Instala dependencias
RUN apt update && apt install -y wget default-jdk openjdk-8-jre sudo
#Cria diretórios e faz download do elastic
RUN cd /elastic && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.17.5-linux-x86_64.tar.gz && tar -xzf elasticsearch-7.17.5-linux-x86_64.tar.gz && mkdir /elastic/elasticsearch-7.17.5/data 
#Copia configuração do elasticsearch para o diretório de config
COPY ./elasticsearch.yml /elastic/elasticsearch-7.17.5/config/
#Altera permissões do diretório do elasticsearch
RUN chown -R elasticsearch:elasticsearch /elastic/elasticsearch-7.17.5
#Publica portas da aplicação
EXPOSE 9200 9300 
#Roda a aplicação
CMD ["sudo","-u","elasticsearch","/elastic/elasticsearch-7.17.5/bin/elasticsearch"]
