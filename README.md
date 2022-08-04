## Baixar Repositório
git clone https://github.com/klebersly/elasticsearch.git && cd elasticsearch

## Build Imagem 
docker build -t kleberd/elastic:latest .

## Comando Docker
docker run --name elasticsearch -p 9200:9200 -p 9300:9300 -d -v es-data:/elastic/elasticsearch-7.17.5/data kleberd/elastic:latest

## Testar status do Elasticsearch

docker logs elasticsearch

curl -XGET http://127.0.0.1:9200
