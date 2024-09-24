# Desafio Yandeh Web

Este é o repositório do **Desafio Yandeh Web**, uma aplicação desenvolvida em **Flutter** para construir uma interface responsiva que se adapta tanto para dispositivos desktop quanto mobile. O projeto inclui recursos como carrosséis de produtos, banners e um cabeçalho com barra de pesquisa e opções de navegação.

## Requisitos

Antes de executar o projeto, certifique-se de ter o ambiente Flutter configurado corretamente. Para verificar, você pode executar o comando:

```
flutter doctor
```

Certifique-se de que todas as dependências necessárias estão instaladas corretamente (Flutter SDK, Android/iOS toolchain, etc).

### Pré-requisitos

- Flutter SDK (versão >= 3.20)
- Android Studio ou VS Code com plugin Flutter
- Dispositivo/emulador para executar o app (iOS ou Android)

## Instruções de Instalação

### 1. Clonar o Repositório

Clone o repositório para o seu ambiente local usando o seguinte comando:

```
git clone https://github.com/camargoguilherme/desafio_yandeh_web.git
```

### 2. Navegar para o Diretório

Entre no diretório do projeto:

```
cd desafio_yandeh_web
```

### 3. Instalar Dependências

Execute o comando abaixo para instalar as dependências do Flutter:

```
flutter pub get
```

### 4. Rodar o Projeto

Após instalar as dependências, você pode rodar o projeto em diferentes plataformas:

- **Android/iOS**:

  Conecte um dispositivo ou inicie um emulador e execute:

  ```
  flutter run
  ```

- **Web**:

  Para rodar no navegador (web):

  ```
  flutter run -d chrome
  ```

  ou execute o comando para executar a aplicação na porta 3002

  ```
  flutter run -d web-server --web-port=3002
  ```

### 5. Estrutura do Projeto

Aqui está uma visão geral dos diretórios principais do projeto:

```
desafio_yandeh_web/
│
├── lib/
│   ├── core/                     # Contém os utilitários e estilos globais do projeto
│   │   ├── components/           # Componentes reutilizáveis, como o header, image e video
│   │   ├── styles/               # Definições de cores e temas
│   │   ├── utils/                # Ferramentas como layouts responsivos
│   │   └── contants.dart         # Arquivo com a configuração da URL e token para requisição
│   ├── modules/                  # Módulos que contêm lógica e widgets de cada tela
│   │   ├── home/                 # Tela principal e widgets da home
│   │   ├── componentes/          # Componentes utilizados na Tela principal
│   │   ├── models/               # Model de Seções e Produtos
│   │   └── services/             # Serviço para realizar requisição HTTP
│   └── main.dart                 # Ponto de entrada do aplicativo
├── assets/                       # Recursos estáticos como imagens e arquivos JSON
└── pubspec.yaml                  # Arquivo de configuração do Flutter (dependências e assets)
```

## Principais Arquivos

- **`lib/main.dart`**: Arquivo principal do projeto que inicializa o app.
- **`lib/modules/home/components/product_banner.dart`**: Exibe os banners de produtos destacados.
- **`lib/modules/home/components/product_carousel.dart`**: Exibe os produtos em um card.
- **`lib/modules/home/components/product_carousel.dart`**: Contém a implementação do carrossel de produtos.
- **`lib/core/components/header_app.dart`**: Implementa o cabeçalho responsivo com barra de pesquisa.
