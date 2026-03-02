🎬 Movie App – Flutter + Clean Architecture + Riverpod
4

Aplicativo de filmes desenvolvido em Flutter, consumindo a API do The Movie Database (TMDB), utilizando Clean Architecture e Riverpod como gerenciador de estado.

O objetivo do projeto é construir uma base sólida, escalável e desacoplada, permitindo expansão futura sem necessidade de grandes refatorações.

🚀 Objetivos do Projeto

Consumir API de filmes (em cartaz, populares, etc.)

Aplicar princípios de Arquitetura Limpa

Separar responsabilidades em camadas bem definidas

Facilitar manutenção, testes e escalabilidade

Permitir troca de API sem impacto nas regras de negócio

Criar uma base robusta para evolução do aplicativo

🧱 Arquitetura do Projeto

O projeto segue o padrão:

lib/
├── config/
├── domain/
├── infrastructure/
└── presentation/

📁 1. Config

Responsável por configurações globais da aplicação:

Constantes

Variáveis de ambiente

Configuração de rotas

Tema da aplicação

Essa camada prepara a base estrutural do app.

📁 2. Domain (Regra de Negócio)

A camada mais importante da aplicação.

Ela não depende de nenhuma tecnologia externa.

Contém:
🔹 Entities

Representam as regras de negócio da aplicação.

Exemplo:

Movie

São estruturas puras que representam o modelo central da aplicação.

Não sabem:

De onde os dados vêm

Se é API, banco ou mock

🔹 Datasources (Abstrações)

Definem o contrato do que uma fonte de dados deve implementar.

Exemplo:

abstract class MoviesDatasource {
Future<List<Movie>> getNowPlaying();
}

Aqui definimos:

"Se você quiser ser uma fonte de dados de filmes, precisa implementar isso."

🔹 Repositories (Abstrações)

São contratos que a aplicação utilizará para acessar os dados.

Servem como intermediários entre:

Camada de apresentação

Camada de dados

Permitem trocar facilmente a origem dos dados.

Hoje pode ser TMDB.
Amanhã pode ser IMDb, Netflix ou qualquer outra API.

📁 3. Infrastructure (Implementações)

Aqui vivem as implementações reais.

🔹 Datasource Implementation

Responsável por:

Fazer requisição HTTP

Tratar resposta

Lidar com erros

Consumir a API do TMDB

🔹 Models

Representam a estrutura exata do JSON retornado pela API.

Exemplo:

MovieModel.fromJson(Map<String, dynamic> json)

Eles ajudam a evitar uso direto de:

json['title']
json['overview']
🔹 Mappers

Transformam:

Model (API) → Entity (Domínio)

Se a API mudar, apenas o mapper precisa ser alterado.

O restante da aplicação continua funcionando normalmente.

🔹 Repository Implementation

Implementa o contrato definido no domínio.

Responsável por:

Receber a datasource

Executar a chamada

Retornar entidades prontas para uso

📁 4. Presentation

Camada visual da aplicação.

Contém:

Widgets

Providers

Lógica de estado

🔹 Providers (Riverpod)

São a ponte entre:

Presentation → Repository → Datasource

Widgets nunca acessam API diretamente.

Eles conversam apenas com Providers.

Isso permite:

Trocar gerenciador de estado no futuro

Testar facilmente

Manter código desacoplado

🔄 Fluxo da Aplicação
Widget
↓
Provider (Riverpod)
↓
Repository
↓
Datasource
↓
API (TMDB)

Resposta volta no sentido contrário, já convertida em Entity.

🛠 Tecnologias Utilizadas

Flutter

Dart

Riverpod

HTTP Client

Clean Architecture

API do The Movie Database

🔐 Variáveis de Ambiente

É necessário configurar a chave da API do TMDB.

Exemplo:

TMDB_API_KEY=your_api_key_here

Recomenda-se utilizar:

.env

flutter_dotenv

Ou configuração segura equivalente

📈 Benefícios da Arquitetura

✔ Fácil manutenção
✔ Código organizado
✔ Alta escalabilidade
✔ Baixo acoplamento
✔ Facilidade para testes
✔ Preparado para crescimento

🧠 Conceitos Aplicados

Separação de responsabilidades

Inversão de dependência

Abstrações

Mapeamento de dados

Gerenciamento de estado desacoplado

Estrutura preparada para crescimento

🔮 Expansão Futura

O projeto está preparado para:

Paginação

Tela de detalhes

Busca de filmes

Favoritos

Cache local

Persistência offline

Publicação na Play Store / App Store

📌 Conclusão

Este projeto foi estruturado com foco em:

Construir uma base sólida desde o início para evitar retrabalho no futuro.

Aplicações sem arquitetura tendem a crescer de forma desorganizada e acabam sendo reescritas.

Com essa estrutura, é possível:

Adicionar funcionalidades

Alterar APIs

Mudar gerenciador de estado

Expandir o projeto

Sem precisar reescrever toda a aplicação.