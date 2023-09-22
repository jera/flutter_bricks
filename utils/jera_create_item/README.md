# Feature Brick

## Brick para iniciar qualquer feature do seu projeto ja com os arquivos criados na arquitetura que utilizamos hoje na Jera.

O módulo vem com a view, view_controller e view_model criada com o nome de sua preferencia, também existe a possibilidade opcional de gerar ou não a factory da feature com a rota pronta para adicionar ao `mobile_router.dart`. <br>

## A estrutura das pastas e arquivos gerados é essa:

  - {name_feature}
    - di
      - {name_feature}\_factory.dart
    - {name_feature}\_view.dart
    - {name_feature}\_view_controller.dart
    - {name_feature}\_view_model.dart

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_create_feature.

```bash
$ mason add jera_create_feature
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto:
```bash
$ mason make jera_create_feature -o lib/features 
```
Note que o que vem depois do -o é o path no qual você gostaria de adicionar essa funcionalidade.

Após isso seu terminal fará duas perguntas, uma para você definir o nome da sua feature, e outra se deve gerar ou não sua factory você deve digitar `s` para gerar e `n` para não gerar.


## Dependencias do modulo

Ao criar sua feature ainda não sera possivel navegar até a tela em si e também não havera nenhum layout predefinido  apenas gerará o necessário para começar uma nova tela, para navegar para sua nova funcionalidade você deverá adicionar a rota gerada do seu factory (caso possua um próprio) no seu mobile router, do contrário deverá adicionar ao seu factory atual essa nova feature.<br>
Segue o código que deve ser adicionado ao MobileRouter:


```dart
static final Map<String, WidgetBuilder> routes = {
  ...
  /// Feature route
  {NameFeature}Factory.nameFeature: (_) {
    return {NameFeature}Factory.nameFeatureRoute();
  },
}
```

## A sua parte na brick
Esse módulo de Create Feature é uma base para a sua nova funcionalidade para otimizar o seu tempo criando e nomeando arquivos. Porém precisa que você de fato execute o que essa feature deveria fazer.



