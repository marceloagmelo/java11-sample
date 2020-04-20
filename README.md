# Docker Imagem Java 11 Sample

### Download da imagem

docker pull marceloagmelo/java-application-11:TAG_NAME

### Como usar a imagem

A imagem contém o script control.sh script, este script possui as seguintes opções.

#### Help

docker run --rm -ti java-application-11:TAG_NAME help
```
========================================
USAGE: /control.sh COMMAND [args]
  Command list:
    - info      : execute info scripts
    - shell     : execute shell scripts
    - start     : execute start scripts
    - status    : execute status scripts
    - test      : execute test scripts
========================================
```

#### Start

```
docker run -d -p 0.0.0.0:8080:8080 marceloagmelo/java-application-11:TAG_NAME start
```

#### shell

```
docker run --rm -ti java-application-11:TAG_NAME shell
```

## Time Zone
Por default a imagem usa o time zone "America/Sao_Paulo", Se você quiser alterar crie uma variável TZ.
