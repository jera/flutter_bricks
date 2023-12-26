# Cache Manager Brick

Brick para criar uma classe de abstração para a biblioteca Shared Preferences chamada Cache Manager.

## Como instalar e gerar os arquivos

Para adicionar a brick em seu ```mason.yaml```:

```bash
$ mason add jera_cache_manager
```

A classe será criada dentro da pasta em que você mesmo inserir através do comando: 

```bash
$ mason make jera_cache_manager -o lib/support/utils
```

OBS: O que vem depois do "-o" é o caminho de onde o arquivo será criado, e isso pode variar de projeto para projeto.


## A sua parte na brick
Haverá um ```TODO``` na função ```initialize()``` referente à forma de logar/tratar o erro ao inicializar a classe. 
