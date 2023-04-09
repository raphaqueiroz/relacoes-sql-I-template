-- Active: 1680983576918@@127.0.0.1@3306


-- Práticas

CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) --referenciando ao "id" da tabela "users";
);

INSERT INTO users VALUES ("1", "João", "joao@email.com", "123456"),
("2", "Maria", "maria@email.com", "123456"),
("3", "Juju", "juju@email.com", "123456");

INSERT INTO phones (id, phone_number, user_id) VALUES 
("P01", "999-9999", "1"),
("p02", "999-9998", "1"),
("p03", "999-9997", "2");

SELECT * FROM phones;

SELECT * FROM users as u INNER JOIN phones as p ON u.id = p.user_id ORDER BY u.name;
 --Unindo as tabelas através da chave de referência que foi estabelecida (FOREIGN KEY);


 -- PRÁTICA 3

CREATE TABLE licences (
    id TEXT UNIQUE PRIMARY KEY NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

INSERT INTO licences VALUES ("001", "456", "B"),
("002", "567", "A"),
("003", "678", "A");

SELECT *FROM licences;

CREATE TABLE drivers (
    id TEXT UNIQUE PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licences (id)
);

INSERT INTO drivers VALUES ("D001", "RAphael", "raphael@email.com", "123456", "001"), 
("D002", "xaninha", "xaninha@email.com", "123456", "002"),
("D003", "Dory", "Dory@email.com", "123456", "003");

SELECT licences.id, drivers.name, licences.category, licences.register_number --Oderm das colunas na busca definida pelo "SELECT";
FROM licences INNER JOIN drivers ON licences.id = drivers.license_id;
