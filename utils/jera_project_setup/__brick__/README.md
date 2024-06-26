<div align="center">
    <h1 align="center">
        <img align="center" alt="Nome do App " title="App Template" src="images/ic_logo_with_app_name.svg"  width=30%/>
    </h1>
</div>

## Links do projeto
- [Trello](https://trello.com/)
- [Adobe XD](https://xd.adobe.com/view/)
- [Documentação Postman](https://documenter.getpostman.com/view/)

## Versões mínimas de suporte

> iOS
- RVM 1.29.12
- Swift 5
- iOS >= 14
- Fastlane 2.216.0
- Ruby 3.2.2

> Android
- minSDK 23
- targetSDK 33



## Tecnologias utilizadas

- Firebase
  - Sub Tópicos
  - Sub Tópicos
  - Sub Tópicos
- Mixpanel
- Fastlane

## Como executar o app?
Tenha certeza que seu ambiente está configurado com todos os softwares necessários. Use o guia do [setup flutter](https://gitlab.com/jera-software/configs-flutter/-/blob/develop/guides/setup_guide.md) para configurar corretamente o ambiente

Com o ambiente pronto, configure um emulador ou conecte um celular via USB no computador com o modo de desenvolvedor ativado.

Antes de executar pela primeira vez rode os comandos `flutter clean` e `flutter pub get` no terminal do projeto. Usando o `flutter clean` você exclui todo o build-cache que está na pasta /build fazendo com que após isso seja obrigatório o comando `flutter pub get` para que o flutter possa estar fazendo novamente o download dos arquivos e depências necessárias para a execução do app

Feito isso podemos executar o projeto de `2 formas`:

**Por linha de comando**

- Abra o terminal no path do projeto e execute `flutter run --release` para executar e instalar o projeto no device em `release mode`

- Abra o terminal no path do projeto e execute `flutter run --debug` para executar e instalar o projeto no device em `debug mode`

**Por interface gráfica**

- No `Visual Studio Code` procure no canto superior direito um ícone de play e lá você poderá executar o app em duas versões sendo elas a maneira padrão ou em modo de debug. Se preferir use o atalho `F5` no seu teclado.

- Pelo `Android Studio` semelhante a IDE acima procure por um ícone de play para que possa estar rodando seu projeto. Se preferir use o atalho `Shift + F10` no seu teclado.




## Como gerar builds para as lojas?
- Siga este [guia para publicar apps nas lojas](https://gitlab.com/jera-software/configs-flutter/-/blob/develop/guides/setup_and_publish_app.md?ref_type=heads) 
### **Alguns passos importantes antes de gerar builds para as lojas**

- Verifique se a versão do app está correta no `pubspec.yaml`. Se não estiver, atualize para a versão correta e lembre-se de commitar isso no git.
- Verifique se o arquivo `api_host.dart` está apontando para os ambientes corretos (API de staging em debug mode | API de produção em release mode)
- Verifique se o `remote_values_enum.dart` está apontando para as chaves corretas no método `String get valueKey {}`

- **SEMPRE EXECUTE O PROJETO ANTES DE GERAR APPBUNDLE** 



## **Gerando Apks para o Android(Validações e testes)**
Para que o tester possa validar o app/features temos duas formas de gerar os apks: Debug e release

Para gerar um apk que tenha configurações de um emulador android use o modo debug com o seguinte comando

> `flutter build apk --debug`

Para gerar um apk que seja o mais próximo do que será entregue ao usuário use o modo de release

> `flutter build apk --release`
