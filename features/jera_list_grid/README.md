# Jera List Grid brick.

## Brick para gerar a implementação de uma lista em formato de grid

O módulo gera a implementação de uma lista simples em formato de grade exibindo dois itens por linha

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_list_grid.

```
$ mason add jera_list_grid
```

Logo após adicionar execute o comando para gerar os arquivos dentro de seu projeto no diretório desejado exemplo:

```
$ mason make jera_list_grid -o lib/feature
```

Note que o que vem depois do -o é o local que você deseja adicionar essa funcionalidade.
Após isso os arquivos serão gerados e as dependencias instaladas.


## A sua parte na brick


Você precisará registrar a feature no ServiceLocator

Também será necessário registrar a feature no GoRouter!

