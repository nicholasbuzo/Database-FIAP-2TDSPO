SET SERVEROUTPUT ON;
SET VERIFY OFF;
drop table funcionario;

-- Criando tabela funcionario
CREATE TABLE Funcionario (
    cd_fun number(2) PRIMARY KEY,
    nm_fun varchar2(100) NOT NULL,
    salario NUMBER(10,2) NOT NULL,
    dt_adm date
);

-- Populando tabela
INSERT INTO Funcionario (cd_fun, nm_fun, salario, dt_adm)
VALUES (1, 'Marcel', 10000, '17/04/2000');
INSERT INTO Funcionario (cd_fun, nm_fun, salario, dt_adm)
VALUES (2, 'Claudia', 16000, '02/10/1998');
INSERT INTO Funcionario (cd_fun, nm_fun, salario, dt_adm)
VALUES (3, 'Joaquim', 5500, '10/07/2010');
INSERT INTO Funcionario (cd_fun, nm_fun, salario, dt_adm)
VALUES (4, 'Valéria', 7300, '08/06/2015');

-- Exibindo nome e salario
DECLARE
    CURSOR c_exibe IS SELECT nm_fun, salario from funcionario;
    v_exibe c_exibe%ROWTYPE;
BEGIN
    OPEN c_exibe;
        LOOP
            FETCH c_exibe into v_exibe;
            EXIT WHEN c_exibe%notfound;
            dbms_output.put_line('Nome: ' || v_exibe.nm_fun || ' - Salário: R$' || v_exibe.salario);
        END LOOP;
    CLOSE c_exibe;
end;

-- Usando FOR
DECLARE
    cursor c_exibe is select nm_fun, salario FROM funcionario;
BEGIN
    FOR v_exibe IN c_exibe LOOP
        dbms_output.put_line('Nome: ' || v_exibe.nm_fun || '- Salário: ' || v_exibe.salario);    
    end loop;
end;

-- Adicionando uma coluna "tempo", coluna numérica que irá salvar os dias em que cada funcionário está trabalhando na empresa
ALTER TABLE funcionario ADD tempo number(5);

DECLARE
    CURSOR C_exibe IS SELECT * FROM funcionario;
BEGIN
    FOR V_exibe IN C_exibe LOOP
        UPDATE funcionario SET tempo = sysdate - v_exibe.dt_adm
        WHERE cd_fun = v_exibe.cd_fun;
    END LOOP;
END;

-- Aumento de 10% do salario para funcionarios com mais de 150 meses de serviço, aumento de 5% aos demais
DECLARE
    CURSOR C_exibe IS SELECT * FROM funcionario;
BEGIN
    FOR V_exibe IN C_exibe LOOP
        IF v_exibe.tempo / 30 >= 150 THEN
        dbms_output.put_line('Aumentando salário de ' || v_exibe.nm_fun || ' em 10%...');
        UPDATE funcionario SET salario = V_exibe.salario * 1.1
        WHERE cd_fun = v_exibe.cd_fun;
        dbms_output.put_line('Novo salário: R$' || v_exibe.salario * 1.1);
        dbms_output.put_line('===========================================');
        ELSE
        dbms_output.put_line('Aumentando salário de ' || v_exibe.nm_fun || ' em 5%...');
        UPDATE funcionario SET salario = v_exibe.salario * 1.05
        WHERE cd_fun = v_exibe.cd_fun;
        dbms_output.put_line('Novo salário: R$' || v_exibe.salario * 1.05);
        dbms_output.put_line('===========================================');
        END IF;
    END LOOP;
END;

select * from funcionario;
