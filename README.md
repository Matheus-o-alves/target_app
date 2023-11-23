# Target App

Descrição detalhada do projeto, sua finalidade e funcionalidades principais.

## Funcionalidades

- **Autenticação de Usuários:** Utilização do Firebase Auth para permitir que os usuários se autentiquem no aplicativo.
- **Gerenciamento de Estado Reactivo:** Implementação do MobX para gerenciar o estado de forma reativa, permitindo adição, salvamento e exclusão de textos na aplicação.
- **Armazenamento Local de Dados:** Uso do Shared Preferences para armazenar informações localmente, como preferências do usuário.
- **Navegação e Injeção de Dependências:** Utilização do Get para navegação entre telas e injeção de dependência.

## Instalação

### Pré-requisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Firebase Project](https://console.firebase.google.com/)

### Passos para Instalação

1. **Clone o Repositório:**
    ```bash
    git clone https://github.com/Matheus-o-alves/target_app
    ```

2. **Acesse o Diretório do Projeto:**
    ```bash
    cd nome-do-repositorio
    ```

3. **Instale as Dependências:**
    ```bash
    flutter pub get
    ```

4. **Configuração do Firebase:**
    - Faça o download do arquivo `google-services.json` do Console do Firebase.
    - Adicione o arquivo baixado na pasta `android/app`.

5. **Execute o Projeto:**
    ```bash
    flutter run
    ```

## Uso

Explicação sobre como utilizar ou testar o projeto. Forneça exemplos se possível.

Por exemplo, após executar o projeto localmente, você pode:
- Fazer login usando um endereço de email e senha.
- Adicionar novos textos à aplicação.
- Visualizar e remover textos existentes.
- Explorar as funcionalidades de autenticação.

<p align="center">
  <img src="https://user-images.githubusercontent.com/65368831/95040833-44e58980-06ab-11eb-9687-601273df2102.gif" width="400" />
</p>

## Contribuição

Se este projeto te interessou e você deseja contribuir:

1. **Faça um Fork do Projeto**
2. **Crie uma Nova Branch:**
    ```bash
    git checkout -b feature/nova-feature
    ```
3. **Faça Commit das Alterações:**
    ```bash
    git commit -am 'Adicione uma nova feature'
    ```
4. **Envie as Alterações:**
    ```bash
    git push origin feature/nova-feature
    ```
5. **Abra um Novo Pull Request**

## Licença

Este projeto está licenciado sob a [Licença XYZ](link-da-licenca). Consulte o ar
