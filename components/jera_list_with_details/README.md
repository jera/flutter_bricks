# Create list with details brick

## Brick para criar uma lista com detalhes no seu projeto, com os arquivos criados no padrão que utilizamos hoje na Jera (Componente com view model e delegate. Features com view, viewModel e ViewController.).

O módulo vem com uma pasta com o nome da feature que você irá digitar no terminal. Arquivos de view, viewModel e viewController. E uma pasta de componente com o item que será construído na lista
   
    - $name
      - component
        * $name_item_view_model.dart
        * $name_item.dart
      * $name_view_controller.dart
      * $name_view_model.dart
      * $name_view.dart
```
Legenda:
    - Pastas
    * Arquivos
```
  

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_list_with_details.

```bash
$ mason add jera_list_with_details
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto:
```bash
$ mason make jera_list_with_details -o lib/features
```
Note que o que vem depois do -o é o path no qual você gostaria de adicionar a pasta com a web view.

## Dependências do módulo

Ao criar os arquivos haverá um placeholder de loading e lista vazia genérico definido na $name_view.dart. 

Você precisará registrar a feature no ServiceLocator, a $name_view_controller.dart precisa do import dele. Portanto, pode haver erros de import a depender da localização e do nome da classe do ServiceLocator.

Também será necessário registrar a feature no GoRouter!


## A sua parte na brick
Esse módulo irá construir uma feature de lista com detalhes, mas regras de negócio, navegações e injeções de dependências precisam ser definidas de acordo com o contexto do seu projeto.

Ele também conta com placeholder de loading, vazio e um componente que é construído pela lista. Esses Widgets devem ser alterados de acordo com a UI do projeto.
