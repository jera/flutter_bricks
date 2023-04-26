# Force Update Brick

Brick para funcionalidade de **Force Update** que é verificar se o aplicativo que o usuário tem instalado é o app mais atualizado.

O módulo vem com um layout pré estabelecido e bem simples que vai nortear o seu desenvolvimento.

<div style="text-align: center"> 
	<img src="images/layout_example.png" height="550">
</div>

## Dependências do módulo

O modulo não funciona por si só ele precisa de algumas configurações e arquivos que utilizamos em todos os nossos projetos na Jera. Esses arquivos são:

- `APIProvider.dart`
- `Endpoint.dart`
- `MobileRouter.dart`

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu `mason.yaml` com o nome `jera_force_update`.

```bash
$ mason add jera_force_update
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto:

```bash
$ mason make jera_force_update -o lib/features 
```

***Note que o que vem depois do `-o` é o path no qual você gostaria de adicionar essa funcionalidade.***

## Adicionar códigos ao `MobileRouter`

Nessa versão da brick optamos por não adicionar o mobile router por não saber como só adicionar o código ao arquivo existente.

Então quando você for adicionar o force update dentro do seu projeto você receberá um erro da classe `force_update.dart` na linha 47 no qual vai faltar a função `goToForceUpdate` dento do `MobileRouter`. 

Segue o código que deve ser adicionado ao `MobileRouter`:

### Adicione o force update as suas rotas

```dart
static final Map<String, WidgetBuilder> routes = {
  ...
  /// Force update
  ForceUpdateFactory.forceUpdateRoute: (context) {
    final isRequiredUpdate = ModalRoute.of(context)?.settings.arguments as bool;
    return ForceUpdateFactory.forceUpdate(isRequiredUpdate: isRequiredUpdate);
  },
}
```

### Adicione a função de navegar para o ForceUpdate

```dart
static void goToForceUpdate({required bool isRequiredVersion}) {
  final predicate = ModalRoute.withName('/');
  final context = MobileRouter.navigatorKey.currentContext;

  if (context == null) return;

  if (isRequiredVersion) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      ForceUpdateFactory.forceUpdateRoute,
      predicate,
      arguments: isRequiredVersion,
    );
  } else {
    Navigator.pushNamed(
      context,
      ForceUpdateFactory.forceUpdateRoute,
      arguments: isRequiredVersion,
    );
  }
}
```

## A sua parte na brick

Esse módulo de Force update é uma base para a sua funcionalidade para otimizar o seu tempo. Porém precisa que algumas informações você preencha que será muito especifica do seu contexto. Então dentro do código estão alguns `TODO`s que você precisa resolve-los. Eles estão nas classes:

- `force_update_view_model.dart`
- `get_minimum_version_use_case.dart`

## Como usar?

Após resolver todos os TODOs e adicionar todos os códigos que precisa é só você chamar o seguinte comando:

```dart
ForceUpdate.instance.verifyVersion();
```

**Recomendado rodar esse comando no `initState` da `splash_screen`, mas podendo ser executado de acordo com o seu contexto.**

*Lembre-se de se certificar que a API de seu projeto tenha a rota e ela esteja funcionando.*