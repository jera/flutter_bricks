# Jera Push Notification brick.

## Brick para gerar a implementação do push notification

O módulo gera os dois helpers que atualmente utilizamos para fazer a implementação de notificação nos projetos o `firebase_push_helper.dart` e `notification_helper.dart` que são necessários para as operações da push.<br>

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_push.

```bash
$ mason add jera_push
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto no diretório desejado exemplo:

```bash
$ mason make jera_push -o lib/support
```

Note que o que vem depois do -o é o path no qual você gostaria de adicionar essa funcionalidade.

Após isso os arquivos serão gerados e as dependencias instaladas.

## Dependencias do modulo

Ao criar os arquivos da notificação ainda não sera possivel receber as notificações apenas será gerado os arquivos com a implementação disso ainda sera necessário fazer o setup do firebase para começar a receber as notificações.Além disso é necessário inicializar o serviço de push na _primeira tela do seu app_ caso inicialize na main pode ocorrer comportamentos estranhos. Não se esqueça também de injetar a dependencia da sua classe de acordo com o padrão do seu projeto<br>
Segue o código de exemplo inicializando a classe do Firebase Push Helper:

```dart
final pushNotificationHelper = FirebasePushHelperHelper.instance;

pushNotificationHelper.initPushConfiguration();
```

## A sua parte na brick

Esse módulo apenas gera a implementação em si que pode ser alterada de acordo com a necessidade, caso o setup do firebase não for concluido não irá funcionar adequadamente. É de extrema importancia também resolver os `// Todo` da implementação para o funcionamento adequado, enviando o token do firebase messaging para a sua respectiva API.
