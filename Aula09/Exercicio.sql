SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE Produtos03;

-- Criando tabelas
CREATE TABLE Produtos01 (
    cd_prod number(2),
    ds_prod varchar2(20))
    
CREATE TABLE Produtos02 (
    cd_prod number(2),
    ds_prod varchar2(20))

CREATE TABLE Produtos03 (
    cd_prod number(2),
    ds_prod varchar2(20))
    
-- Populando tabelas
INSERT INTO Produtos01 (cd_prod, ds_prod)
VALUES (1, 'Café');
INSERT INTO Produtos01 (cd_prod, ds_prod)
VALUES (2, 'Água');
INSERT INTO Produtos01 (cd_prod, ds_prod)
VALUES (3, 'Carvão');
INSERT INTO Produtos01 (cd_prod, ds_prod)
VALUES (4, 'Papel Hig.');

INSERT INTO produtos02 (cd_prod, ds_prod)
VALUES (1, 'Café');
INSERT INTO produtos02 (cd_prod, ds_prod)
VALUES (2, 'Peixe');
INSERT INTO produtos02 (cd_prod, ds_prod)
VALUES (3, 'Papel Hig.');
INSERT INTO produtos02 (cd_prod, ds_prod)
VALUES (4, 'Refrigerante');
INSERT INTO produtos02 (cd_prod, ds_prod)
VALUES (5, 'Arroz');

-- Criar tabela 3 com produtos das tabelas 1 e 2 (sem redudância)
DECLARE
    CURSOR c_pd1 IS SELECT cd_prod, ds_prod FROM Produtos01;
    CURSOR c_pd2 IS SELECT cd_prod, ds_prod FROM Produtos02;
    v_existe NUMBER;
    v_novo_id NUMBER;
BEGIN
    FOR v_pd1 IN c_pd1 LOOP
        SELECT COUNT(*) INTO v_existe FROM produtos03
        WHERE ds_prod = v_pd1.ds_prod;
        IF v_existe = 0 THEN
            -- Tive que pesquisar essa parte no gepeto, mas arrumei o ID repetido <3
            SELECT NVL(MAX(cd_prod), 0) + 1
            INTO v_novo_id
            FROM produtos03;
            
            INSERT INTO produtos03
            VALUES (v_novo_id, v_pd1.ds_prod);
        END IF;
    END LOOP;
    
    FOR v_pd2 IN c_pd2 LOOP
        SELECT COUNT(*) INTO v_existe FROM produtos03
        WHERE ds_prod = v_pd2.ds_prod;
        IF v_existe = 0 THEN
            SELECT NVL(MAX(cd_prod), 0) + 1
            INTO v_novo_id
            FROM produtos03;
            
            INSERT INTO produtos03
            VALUES (v_novo_id, v_pd2.ds_prod);
        END IF;
    END LOOP;
END;

select * from produtos03;
