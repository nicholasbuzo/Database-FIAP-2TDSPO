set serveroutput on;
set verify off;

-- Loop
DECLARE
    v_contador NUMBER(2) := 1;
BEGIN
LOOP
    dbms_output.put_line(v_contador);
    v_contador := v_contador + 1;
    EXIT WHEN v_contador > 20;
END LOOP;
END;

-- While
DECLARE
v_contador NUMBER(2) := 1;
BEGIN
WHILE v_contador <= 20 LOOP
    dbms_output.put_line(v_contador);
    v_contador := v_contador +1;
END LOOP;
END;

-- For
BEGIN
FOR v_contador IN 1..20 LOOP
    dbms_output.put_line(v_contador);
END LOOP;
END;

-- Exercicio tabuada em LOOP
DECLARE
 v_tabu NUMBER(4) := &numero;
 v_conta NUMBER(4) := 1;
 v_total NUMBER(4) := 0;
BEGIN
LOOP
    v_total := v_tabu * v_conta;
    dbms_output.put_line(v_tabu || ' X ' || v_conta || ' = ' || v_total);
    v_conta := v_conta + 1;
    EXIT WHEN v_conta > 10;
END LOOP;
END;

-- Exercicio tabuada em WHILE
DECLARE
 v_tabu NUMBER(4) := &numero;
 v_conta NUMBER(4) := 1;
 v_total NUMBER(4) := 0;
BEGIN
    WHILE v_conta <= 10 LOOP
    v_total := v_tabu * v_conta;
    dbms_output.put_line(v_tabu || ' X ' || v_conta || ' = ' || v_total);
    v_conta := v_conta + 1;
END LOOP;
END;

-- Exercicio tabuada em FOR
DECLARE
    v_tabu NUMBER(4) := &numero;
    v_total NUMBER(4) := 0;
BEGIN
    FOR v_conta IN 1..10 LOOP
        v_total := v_tabu * v_conta;
        dbms_output.put_line(v_tabu || ' X ' || v_conta || ' = ' || v_total);
    END LOOP;
END;

-- Ex. 2: Em um intervalo numérico inteiro, informar quantos números são pares e quantos são ímpares
-- LOOP
DECLARE
v_inicio NUMBER(3) := 1;
v_fim NUMBER(3) := &valor;
v_pares NUMBER(3) := 0;
v_impares v_pares%type := 0;
BEGIN
    LOOP
        IF MOD(v_inicio, 2) = 0 THEN
            v_pares := v_pares + 1;
        ELSE
            v_impares := v_impares + 1;
        END IF;
        v_inicio := v_inicio + 1;
    EXIT WHEN v_inicio > v_fim;
    END LOOP;
    dbms_output.put_line('Quantidade números pares: ' || v_pares);
    dbms_output.put_line('Quantidade números ímpares: ' || v_impares);
END;

-- WHILE
DECLARE
v_inicio NUMBER(3) := 1;
v_fim NUMBER(3) := &valor;
v_pares NUMBER(3) := 0;
v_impares v_pares%type := 0;
BEGIN
    WHILE v_inicio <= v_fim LOOP
        IF MOD(v_inicio, 2) = 0 THEN
            v_pares := v_pares + 1;
        ELSE
            v_impares := v_impares + 1;
        END IF;
        v_inicio := v_inicio + 1;
    END LOOP;
    dbms_output.put_line('Quantidade números pares: ' || v_pares);
    dbms_output.put_line('Quantidade números ímpares: ' || v_impares);
END;

-- FOR
DECLARE
v_inicio NUMBER(3) := 1;
v_fim NUMBER(3) := &valor;
v_pares NUMBER(3) := 0;
v_impares v_pares%type := 0;
BEGIN
    FOR v_conta IN 1..v_fim LOOP
        IF MOD(v_inicio, 2) = 0 THEN
            v_pares := v_pares + 1;
        ELSE
            v_impares := v_impares + 1;
        END IF;
        v_inicio := v_inicio + 1;
    END LOOP;
    dbms_output.put_line('Quantidade números pares: ' || v_pares || CHR(10) || 'Quantidade números ímpares: ' || v_impares);
    -- chr(10) => quebra de linha
END;

-- Ex. 3: Exibir e média dos valores pares em um intervalo numérico e soma dos ímpares
