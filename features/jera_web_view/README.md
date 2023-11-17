# Create Web View Brick

## Brick para criar um componente web view no seu projeto, com os arquivos criados no padrão que utilizamos hoje na Jera.

O módulo vem com uma pasta chamada web_view_component, onde você pode passar uma url para ser exibida na web view.<br>

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_web_view.

```bash
$ mason add jera_web_view
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto:
```bash
$ mason make jera_web_view -o lib/features
```
Note que o que vem depois do -o é o path no qual você gostaria de adicionar a pasta com a web view.

## Dependências do módulo

Ao criar os arquivos não haverá um widget de loading definido no web_view_component_view.dart para lidar com o carregamento da web view, você terá que passar um de sua preferência. Também pode acontecer de existirem imports incorretos no arquivo web_view_component_module.dart, pois o import pode variar de acordo com o nome do arquivo service locator usado em seu projeto.

Para navegar para esta tela você precisa passar uma string, que no caso é a url a ser exibida na web view, utilizando o go_router sua navegação ficaria mais ou menos assim: 

```dart
      GoRoute(
        path: 'web_view',
        name: 'web_view',
        builder: (_, state) {
          final webViewUrl = state.extra as String;
          return WebViewComponentViewController(
            webViewUrl: webViewUrl,
          );
        },
      ),
```



## A sua parte na brick
Esse módulo de web view é uma base para adicionar uma web view em seu projeto, com o objetivo de otimizar seu tempo, porém pode ser que você tenha que implementar ajustes para fazer com que a web view funcione corretamente no contexto do seu projeto, por exemplo implementando a permissão de data tracking, caso a url utilizada na web view precise dessa permissão.
