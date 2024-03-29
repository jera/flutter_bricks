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

### Configuração iOS nativo

#### AppDelegate.swift

O arquivo `AppDelegate.swift` é voltado para lidar com eventos do ciclo de vida de uma aplicação no iOS. Esse arquivo é criado por padrão nas aplicações flutter que possuem suporte para dispositivos iOS. Com isso, atualizamos esse arquivo para que quando a nossa aplicação for inicializada em um dispositivo iOS, podemos realizar um setup específico para receber notificações no iOS. Dito isso, iremos fazer as alterações no arquivo seguindo os comentários abaixo:

```swift
import UIKit
import Flutter
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // Adicione essa parte para realizar o setup do local notifications
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    
    // Adicione essa parte para se registrar para ouvir notificações remotas
    application.registerForRemoteNotifications()
    

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Caso tenha problemas em obter o token no iOS em release adicione esse trecho de código
  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
    super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
  }
}
```

[Habilitar notificações remotas em background](https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app#2980038)

Caso tenha problemas em receber uma notificação em background no iOS, habilite o background mode para executar notificações remotas e realizar buscas em segundo plano: [push em background](https://developer.apple.com/documentation/xcode/configuring-background-execution-modes)

Esse módulo apenas gera a implementação em si que pode ser alterada de acordo com a necessidade, caso o setup do firebase não for concluido não irá funcionar adequadamente. É de extrema importancia também resolver os `// Todo` da implementação para o funcionamento adequado, enviando o token do firebase messaging para a sua respectiva API.

### Configuração do código

#### Mobile Router

O redirecionamento da notificação foi feito utilizando o Mobile Router, onde definimos um navegação de redirecionamento para alguma parte da aplicação e utilizamos essa navegação no `_clickHandler` da notificação, caso seja necessária de outra maneira na sua aplicação, remova o Mobile Router e forneça ao `_clickHandler` uma nova forma de redirecionamento através de outra função.
