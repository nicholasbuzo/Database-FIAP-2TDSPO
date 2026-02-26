set serveroutput on
set verify off

Testando números com decimais
declare
v number(7,2) := 11110.11;
begin
dbms_output.put_line(v);
end;

Exercício: Criar um programa que apresente a média aritmética de quatro números reais
DECLARE
    n1 NUMBER(4) := &val1;
    n2 n1%TYPE := &val2;
    n3 n1%TYPE := &val3;
    n4 n1%TYPE := &val4;
BEGIN
    dbms_output.put_line('A média aritmética dos números inseridos é: '
                         ||(n1 + n2 + n3 + n4) / 4);
END;