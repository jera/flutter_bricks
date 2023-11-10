# Create Item Brick

## Brick para criar a estrutura básica de um item no seu projeto, com os arquivos criados no padrão que utilizamos hoje na Jera.

O módulo vem com o item_view e item_view_model criado com o nome de sua preferência, também existe a possibilidade opcional de gerar ou não um delegate no seu item_view_model. <br>

## A estrutura das pastas e arquivos gerados é essa:

  - {name_feature}
    - {name_feature}\_item_view_model.dart
    - {name_feature}\_item_view.dart

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_create_item.

```bash
$ mason add jera_create_item
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto:
```bash
$ mason make jera_create_item -o lib/features/{caminho da sua pasta}
```
Note que o que vem depois do -o é o path no qual você gostaria de adicionar esse item.

Após isso seu terminal fará duas perguntas, uma para você definir o nome do seu item, e outra se deve gerar ou não um delegate, você deve digitar `s` para gerar e `n` para não gerar.


## Dependências do módulo

Ao criar seu item não haverá nenhum layout predefinido, apenas será gerado o necessário para começar um novo item.

## A sua parte na brick
Esse módulo de Create Item é uma base para o seu novo item, com o objetivo de otimizar seu tempo criando e nomeando arquivos. Porém é necessário que você de fato complemente criando a lista responsável por exibir este item.
