# Java 1

Criação de uma aplicação rodando o hava 11

## Containers

Para rodar em containers executar o seguinte comando:

```
./scripts/startContainers.sh
```

Irá subir o container:

- Aplicação web

> http://localhost:8080

## Kubernetes

Para rodar em containers no kubernetes executar o seguinte comando:

```
./scripts/startKubernetes.sh
```

Irá subir o container:

- Aplicação web

> http://java11.marceloagmelo.net

## Observação

Precisa atualizaro arquivo /etc/hosts com os seguintes dados:

```
IP_CLUSTER java11.marceloagmelo.net
```

