Triggers/Gatilhos são blocos PL/SQL disparados automática e implicitamente
sempre que ocorrer um evento associado a uma tabela (INSERT, UPDATE, DELETE).

Sintaxe:

CREATE OR REPLACE TRIGGER nome_trigger
(BEFORE | AFTER) (INSERT | UPDATE | DELETE) OF
(nome_coluna1, nome_coluna2 ... )
ON nome_tabela
FOR EACH ROW
REFERENCING OLD AS ANTIGO NEW AS NOVO
WHEN <condição>
DECLARE
...
BEGIN
...
END;
