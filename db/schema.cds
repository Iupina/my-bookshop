// Usado para organizar pacotes e evitar conflitos de nomes entre projetos diferentes.
namespace my.bookshop;

using {Country, managed} from '@sap/cds/common';

// author: associação (chave estrangeira) para a entidade Authors.
    entity Books {
        key ID     : Integer;
            title  : localized String;
            author : Association to Authors;
            stock  : Integer;
    }


// books: associação de volta para os livros daquele autor (inverso da associação em Books).
// books.author = $self → associa os livros cujo autor é este mesmo autor ($self).
    entity Authors {
        key ID    : Integer;
            name  : String;
            books : Association to many Books on books.author = $self;
    }

// Orders herda os campos de auditoria por usar : managed
// UUID (gerado automaticamente).
// book: o livro comprado (associação para Books).
// country: usa o tipo Country do @sap/cds/common.
// 
    entity Orders : managed {
        key ID      : UUID;
            book    : Association to Books;
            country : Country;
            amount  : Integer;
    }

// Resumo das relações:
// Um livro tem um autor.
// Um autor pode ter muitos livros.
// Um pedido (order) está relacionado a um livro e a um país.