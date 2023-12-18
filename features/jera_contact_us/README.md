# "Contact Us" Brick

Uma brick para criar uma feature de fale conosco no seu projeto. Esta tela apresenta uma AppBar, uma descrição informativa sobre o serviço, um menu suspenso para a seleção do tema desejado, e um campo de texto para a digitação da mensagem.

> Brick para criar uma feature de "entre em contato",  com arquivos desenvolvidos no padrão atualmente adotado pela Jera.

## 🗺️ Guia de Instalação e Geração de Arquivos

Para integrar a brick, adicione-a ao seu arquivo `mason.yaml` utilizando o nome `jera_contact_us`.

```bash
mason add jera_contact_us
```

Após a adição, execute o comando para gerar os arquivos em seu projeto:

```bash
mason make jera_contact_us -o lib/features
```

Observe que o que segue após o `-o` é o caminho no qual você deseja adicionar a pasta com a feature de `contact_us`.

## 🤔 Quais são as pendências?

Esta brick foi projetada para agilizar o desenvolvimento da funcionalidade 'Fale Conosco', apresentando um layout genérico. No entanto, é necessário revisar e personalizar os arquivos de acordo com o padrão do seu projeto, incluindo:

- Modificação da appBar
- Adaptação de textos
- Ajustes de cores
- Personalização de elementos de carregamento (Loadings)

Além disso, a integração com a API ainda não está implementada nesta brick, exigindo a sua intervenção para essa implementação. Para facilitar, adicionamos `TODOs` pela feature relacionadas a essa tarefa.

Por fim, para modificar as opções no dropdown do *Fale Conosco*, basta ajustar o enum `contact_us_options.dart`.
