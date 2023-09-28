# Project Setup Brick
Brick para acelerar o processo de **setup**  da stack flutter na Jera.

O módulo vem com o setup de api, o localize, e mobile_router configurado e também as classes de estilo do appThemes e appColors criada e estanciada e também vem uma tela inicial para poder prosseguir com o desenvolvimento.

<div style="text-align: center"> 
	<img src="images/layout_example.png" height="550">
</div>

## Dependências do módulo

O modulo de setup ja deixa o projeto funcional para seu primeiro run e configurações iniciais, porém ao gerar a brick de setup é necessário ao abrir seu projeto rodar o comando:

```bash
$ flutter pub get
```

para instalar as dependências necessárias e gerar seu arquivo de localize.

## Como instalar e gerar os arquivos

Para utilizar da brick adicione ela ao seu `mason.yaml` com o nome `jera_force_update`.

```bash
$ mason add jera_project_setup
```

Logo após adicionar rode o comando para gerar os arquivos dentro de seu projeto:

```bash
$ mason make jera_project_setup -o ${diretorio_dos_seus_projetos}
```

***Note que o que vem depois do `-o` é o path no qual você gostaria de adicionar o projeto novo.***