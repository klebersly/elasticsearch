## Baixar Repositório

## Build Imagem 
docker build -t klebed/elastic:latest .

## Comando Docker
docker run --name elasticsearch -p 9200:9200 -p 9300:9300 -d -v es-data:/elastic/elasticsearch-7.17.5/data kleberd/elastic:latest
