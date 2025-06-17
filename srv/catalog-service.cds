using my.bookshop as my from '../db/schema';

// Esse bloco define o serviço OData que será exposto.
service CatalogService {
    entity Books @readonly    as projection on my.Books;
    // @readonly → apenas leitura permitida via serviço.
    entity Authors @readonly  as projection on my.Authors;
    // @readonly → apenas leitura permitida via serviço.
    entity Orders @insertonly as projection on my.Orders;
    // @insertonly → A API só aceita criação de dados (POST) na entidade Orders.
    // Não permite leitura, atualização ou exclusão via OData.
    // Muito útil para receber pedidos ou eventos, por exemplo, sem mostrar dados.
}

// Usar projection te permite:
// Modificar o nome da entidade
// Selecionar colunas específicas
// Aplicar restrições
// Adicionar anotações (@readonly, @title, etc.)
// Facilita manutenção e segurança

