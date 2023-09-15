# Jera SessionManager brick.

## Brick para gerar a implementação do sessionManager

O módulo gera a implementação do session manager e um objeto simples de user para manipular a sessão dos devices com o secureStorage<br>

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_session_manager.

```bash
$ mason add jera_session_manager
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto no diretório desejado exemplo:

```bash
$ mason make jera_session_manager -o lib/support
```

Note que o que vem depois do -o é o path no qual você gostaria de adicionar essa funcionalidade.

Após isso os arquivos serão gerados e as dependencias instaladas.

## Como utilizar?

Após adicionar os arquivos em seu projeto basta recuperar a instancia e utilizar para salvar a sessão do seu usuário

```dart
final sessionManager = SessionManager.instance;
final user = User(
  name: 'Jera User',
  email: 'email@jera.com',
  token: 'token_jera',
  );

sessionManager.createSession(user);
```

## A sua parte na brick

Esse módulo apenas gera a implementação em si que pode ser alterada de acordo com a necessidade, o objeto user também pode ser manipulado de acordo com a necessidade.
