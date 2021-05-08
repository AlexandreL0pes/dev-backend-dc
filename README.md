<h1 align="center">
  Teste Técnico - Delivery Center
</h1>

# Índice

- [Índice](#índice)
  - [:bookmark: Sobre](#bookmark-sobre)
  - [:fire: Instalação/Execução](#fire-instalaçãoexecução)
    - [Aplicação Web](#aplicação-web)
  - [:rocket: Tecnologias Utilizadas](#rocket-tecnologias-utilizadas)

<a id="sobre"></a>
## :bookmark: Sobre 

Teste técnico para a vaga de Desenvolvedor Back-End Júnior na [Delivery Center](https://www.deliverycenter.com/)

A solução desenvolvida recebe um `payload` contendo dados sobre um pedido, efetuando a validação com uma API externa, além da persistência dos dados recebidos em um banco de dados.

<a id="como-usar"></a>
## :fire: Instalação/Execução
<a id="#aplicação-web"></a>
### Aplicação Web
- Clone o seguinte repositório: 
  
  ```bash
  git clone https://github.com/AlexandreL0pes/dev-backend-dc
  ```
  
- Instale todas a imagem docker e suas dependências:  
  ```bash
  docker-compose build 
  ```
- Inicie o banco de dados da aplicação e migre as alterações:   
  ```bash
  docker-compose run api rake db:drop db:create db:migrate db:seed
  ```
- Inicie a aplicação web:
  ```bash
  docker-compose up
  ```

- Execução de testes:
  ```bash
  docker-compose run bundle exec rspec 
  ```

<a id="tecnologias-utilizadas"></a>
## :rocket: Tecnologias Utilizadas

O projeto foi desenvolvido utilizando as seguintes tecnologias:
- [Ruby on Rails 6.0](https://rubyonrails.org/)
- [Ruby 2.6](https://www.ruby-lang.org/pt/)
- [PostgreSQL 12](https://www.postgresql.org/)

---

<h4 align="center">
    Desenvolvido por Alexandre Lopes 
</h4>
