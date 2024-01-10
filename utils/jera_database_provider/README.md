# Database Provider Brick

O módulo vem com uma pasta de setup onde é feita a configuração do banco de dados, e uma pasta table onde você pode deixar suas tabelas. <br>

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_database_provider.

```bash
$ mason add jera_database_provider
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto:
```bash
$ mason make jera_database_provider -o lib
```
Note que o que vem depois do -o é o path no qual você gostaria de adicionar esse item.

## A sua parte na brick
Esse módulo é apenas uma configuração inicial do seu banco de dados, você ainda precisará criar as tabelas e dao's. No arquivo ```database/setup/database_provider.dart``` existem dois TODO's que você deve alterar de acordo com seu projeto
