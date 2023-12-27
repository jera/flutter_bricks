# Bottom Navigation Brick

## Brick para criar a feature Bottom Navigation no seu projeto já com os arquivos criados na arquitetura que utilizamos hoje na Jera.

O módulo vem com a view, view_controller e view_model criada com o nome de BottomNavigation, também contém a pasta `Di` que nela temos o arquivo `bottom_navigation_module.dart` onde registramos a view_model no GetIt. <br>

## A estrutura das pastas e arquivos gerados é essa:

  - bottom_navigation
    - di
      - bottom_navigation_module.dart
    - bottom_navigation_view.dart
    - bottom_navigation_view_controller.dart
    - bottom_navigation_view_model.dart

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_bottom_navigation.

```bash
$ mason add jera_bottom_navigation
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto:
```bash
$ mason make jera_bottom_navigation -o lib/features 
```
Note que o que vem depois do -o é o path no qual você gostaria de adicionar essa funcionalidade.

Após isso seu terminal irá indicar quando a Brick for JERAda com sucesso.


## Dependencias do modulo
Essa Brick somente cria os arquivos no padrão seguido aqui na Jera, então não estamos fazendo a importação dos packages get_it e go_router visto que suponhamos que no seu projeto já tenha essas libs (Que são adicionadas quando usamos a Brick jera_project_setup). Caso não tenha esses packages no seu projeto deverá ser feita a instalação para que a Brick funcione corretamente. Não fazemos a criação do arquivo `mobile_router.dart` pois provavelmente já exista um no seu projeto, caso já exista basta adicionar o trecho de código abaixo no seu `mobile_router.dart`. <br>
Segue o código que deve ser adicionado ao MobileRouter:


```dart
  //TODO: Lembre-se de alterar as rotas caso precise, essas são as rotas padrões.
  static const String homeRoute = '/home';
  static const String profileRoute = '/profile';
  static const String settingsRoute = '/settings';

  static final GoRouter router = GoRouter(

      //Bottom Navigation
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) {
          return BottomNavigationViewController(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              /// Home
              GoRoute(
                path: homeRoute,
                name: homeRoute,
                builder: (_, __) => Container(), //TODO: Adicionar a tela desejada.
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              /// Profile
              GoRoute(
                path: profileRoute,
                name: profileRoute,
                builder: (_, __) => Container(), //TODO: Adicionar a tela desejada.
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              /// Profile
              GoRoute(
                path: settingsRoute,
                name: settingsRoute,
                builder: (_, __) => Container(), //TODO: Adicionar a tela desejada.
              ),
            ],
          ),
        ],
      ),
  );
```

## A sua parte na brick
Esse módulo de Bottom Navigation é uma base para a sua nova funcionalidade para otimizar o seu tempo criando e nomeando arquivos. Porém precisa que você de fato execute o que essa feature deveria fazer, estilize conforme o layout do seu projeto.
