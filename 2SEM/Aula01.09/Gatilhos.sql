Triggers/Gatilhos são blocos PL/SQL disparados automática e implicitamente
sempre que ocorrer um evento associado a uma tabela (INSERT, UPDATE, DELETE).

Aplicações:
Manutenção de tabelas.
Implementação de níveis de segurança mais complexos.
Geração de valores de colunas.

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

Tempo
Os tempos de uma trigger podem ser:
BEFORE - antes do evento
AFTER - depois do evento
 
Evento
Os eventos de uma trigger podem ser:
INSERT
UPDATE
DELETE
 
A cláusula REFERENCING está substituindo as áreas de memória OLD e NEW por 
ANTIGO e NOVO

-- Exercícios:
-- Criar um tabela de senhas e uma de auditoria que grave as alterações das senhas,
-- com codigo do usuário que alterou a senha, a senha antiga,a senha nova e a data
-- de modificação;

CREATE TABLE SENHAS (
    ID_USUARIO NUMBER(4),
    SENHA VARCHAR2(12));
    
CREATE TABLE AUDITORIA
    (ID_USUARIO NUMBER(4),
    SENHA_ANTIGA VARCHAR(12),
    SENHA_NOVA VARCHAR(12),
    DATA_MODIFIC DATE);
    
CREATE OR REPLACE TRIGGER MONITORA_SENHA
BEFORE UPDATE
OF SENHA
ON SENHAS
FOR EACH ROW
BEGIN
    INSERT INTO AUDITORIA
    VALUES
    (:OLD.ID_USUARIO, :OLD.SENHA, :NEW.SENHA, SYSDATE);
END;

INSERT INTO SENHAS VALUES (1001, 'teste123');
UPDATE SENHAS SET SENHA = '123teste' WHERE ID_USUARIO = 1001;
SELECT * FROM AUDITORIA;

-- Criar um gatilho que monitore a inserção de novos produtos na tabela produto.

CREATE OR REPLACE TRIGGER MONITORA_PRODUTO
AFTER INSERT
ON PRODUTO
FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('PRODUTO ADICIONADO: ' || :NEW.DESCRICAO || ' R$' || :NEW.VAL_UNIT);
END;

INSERT INTO PRODUTO VALUES (33, 'KG', 'Pão sovado', 12.74);
