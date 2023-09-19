# Events Manager Brick

## Brick para gerar o eventManager

O módulo gera o arquivo `events_manager.dart` pronto para o uso dos eventos tanto do mixPanel quanto do firebase. <br>

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu mason.yaml com o nome jera_events.

```bash
$ mason add jera_events
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto no diretório desejado exemplo:

```bash
$ mason make jera_events -o lib/support
```

Note que o que vem depois do -o é o path no qual você gostaria de adicionar essa funcionalidade.

Após isso o arquivo será gerado e as dependencias instaladas.

## Dependencias do modulo

Ao criar seu eventManager ainda não sera possivel triggar os eventos em si apenas será gerado o arquivo com a implementação disso ainda sera necessário fazer o setup do firebase ou adicionar nas constantes da classe seu token do mixPanel para começar a disparar os eventos. Não se esqueça também de injetar a dependencia da sua classe onde desejado<br>
Segue o código de exemplo utilizando a classe do EventManager:

```dart
///Para o firebase:
final eventManager= FirebaseEvents.instance;

///Para o mixPanel:
final eventManager = MixpanelEvents.instance;

 /// Triggando o evento:
 eventManager.triggerEvent(eventName:'event_name');
```

## A sua parte na brick

Esse módulo de gerar o eventManager apenas gera a implementação em si que pode ser alterada de acordo com a necessidade, caso o setup do firebase não for concluido ou o token do mixPanel não for inserido a brick não irá funcionar adequadamente.
