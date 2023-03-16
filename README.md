# Flutter Mason Bricks Doc

- Antes de começar é importante fazer todo o [setup do flutter](https://gitlab.com/jera-software/configs-flutter/-/blob/develop/guides/setup_guide.md) pois sem o dart-sdk não é possível utilizar o mason.

## Setup

Você pode consultar a [doc oficial](https://docs.brickhub.dev/) caso ache necessário porém aqui ta um passo a passo do que devemos fazer para utilizar o mason da melhor forma possivel.</br>
Para utilizar o mason você deve ativar o mason_cli no seu sistema através do comando:

```
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli
```

Após isso feito você pode entrar no diretório onde seus projetos estão armazenados e rodar um:

```
mason init
```

📁Ops é importante rodar isso na pasta onde ficam seus projetos e não na pasta do projeto em si para não subir arquivos desnecessários no repositório do seu projeto.

## Adicionando bricks

Após isso feito será gerado um arquivo `mason.yaml` com a seguinte configuração:

```
# Register bricks which can be consumed via the Mason CLI.
# https://github.com/felangel/mason
bricks:
  # Sample Brick
  # Run `mason make hello` to try it out.
  hello: 0.1.0+1
  # Bricks can also be imported via git url.
  # Uncomment the following lines to import
  # a brick from a remote git url.
  # widget:
  #   git:
  #     url: https://github.com/felangel/mason.git
  #     path: bricks/widget
```

Você pode rodar um `mason remove hello` para limpar esses comentários e a brick hello que não iremos utilizar.

Agora com seu `mason.yaml` limpo podemos começar importar as bricks que vamos de fato utilizar.

Existem duas formas de você adicionar bricks em seu projeto, se a brick que você for utilizar estiver publicada no [brickhub](https://brickhub.dev/) você pode rodar o seguinte comando:

```
mason add $brick_name
```

Porém se ainda não estiver publicado você pode adicionar bricks locais clonando nosso repositório e adicionando o path no `mason.yaml` desse modo:

```
bricks:
  hello: 0.1.0+1
  brick_name:
    path: "flutter-mason-bricks\\brick_name"
```

Com as bricks adicionadas para utilizar basta rodar o comando:

```
mason make brick_name
```

Caso queira especificar em qual pasta deva gerar sua brick basta passar o atributo `-o` e o path que gostaria que a brick fosse gerada por exemplo:

```
mason make brick_name -o lib/features/
```

## Criando // dando manutenção em uma brick:

Quando você cria e da manutenção nas bricks a tendencia é aparecer muitos erros de código devido ao analyzer do VS code para evitar isso adicionamos um arquivo chamado `analysis_options.yaml` com a seguinte configuração:

```
analyzer:
  exclude:
    - create_feature/**
    - project_setup
```

## Publicando uma brick ou atualizando bricks existentes:

O acesso a conta do brickhub é o mesmo do gmail do mobile@jera.com que está na nossa [wiki](https://sites.google.com/a/jera.com.br/intranet/contas-e-servi%C3%A7os)

// TODO depois do dojo
