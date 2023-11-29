# Brick de Login com Rede Social

Brick de fazer **Login** e **Login com as redes social Apple, Google e FaceBook**.

Este módulo pede alguns condicionais que refletem nos arquivos gerados e no layout que ja vem pré estabelecido sendo simples para nortear o seu desenvolvimento. <br>
Para quando você aceita os condicionais de integração com rede social dessa forma:

<img src="assets/with_social_example.png" />
Será gerado o seguinte template de layout para o cadastro e login:

<img src="assets/login_social_example.png" height="550"/> <img src="assets/register_social_example.png" height="550"/>

Ja para a opção de gerar sem a integação de redes sociais:

<img src="assets/without_social_example.png" />

Temos o seguinte design: <br>
<img src="assets/login_example.png" height="550"/> <img src="assets/register_example.png" height="550"/>

Reforço que todos os botões de login com rede social e seus respectivos use_cases e routes são opcionais e caso queira apenas 1 das integrações todo o código e import de bibliotecas não será adicionado ao módulo e o layout será modificado com apenas 1 dos botões da rede social.

## Dependências do módulo

O modulo não funciona por si só, ele precisa de algumas configurações e arquivos que utilizamos em todos os nossos projetos na Jera. Esses arquivos são:

- `APIProvider.dart`
- `Endpoint.dart`
- `MobileRouter.dart`
- `login_module.dart`

No caso das aplicações que utilizaram de serviços de integração com rede social será necessário executar todo o setup no painel do `firebase` e/ou serviços externos como `facebook developer` `apple developer` para o funcionamento adequado da funcionalidade, o módulo apenas gera a implementação desses recursos.

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu `mason.yaml` com o nome `jera_auth`.

```bash
$ mason add jera_auth
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto:

```bash
$ mason make jera_auth -o lib/features
```

**_Note que o que vem depois do `-o` é o path no qual você gostaria de adicionar essa funcionalidade._**

## Adicionar códigos ao `MobileRouter`

Nessa versão da brick optamos por não adicionar o mobile router por não saber como só adicionar o código ao arquivo existente.

Então quando você for adicionar o cadastro e login dentro do seu projeto e tentar navegar você receberá um erro pois faltará declarar as instâncias do `MobileRouter`.

Segue o código que deve ser adicionado ao `MobileRouter`:

### Adicione o force update as suas rotas

```dart
static final Map<String, WidgetBuilder> routes = {
  ...
  /// Authentication
  AuthFactory.loginRoute: (_) => AuthFactory.login(),
  AuthFactory.registerRoute: (_) => AuthFactory.register(),
}
```

## A sua parte na brick

Esse módulo de Auth é uma base para a sua funcionalidade para otimizar o seu tempo. Porém precisa que algumas informações e que você preencha que será muito especifica do seu contexto. Então dentro do código estão alguns `TODO`s que você precisa resolve-los.

## Como usar?

Após resolver todos os TODOs e adicionar todos os códigos que precisa é só você estilizar suas telas de acordo com a necessidade e estará pronto para o uso.
dendo ser executado de acordo com o seu contexto.\*\*

_Lembre-se de se certificar que a API de seu projeto está condizente com o arquivo `user_routes.dart` e suporta todas as formas de autenticação e que a rota já exista e esteja funcionando._
