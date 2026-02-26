PLSQL - Exclusivo da Oracle

Comandos de ambiente

Servidor de saída de dados
set serveroutput on

Desabilitar verificação de variável de memória
set verify off

Estrutura
    Bloco anônimo
declare
    variáveis
begin
    processamento, decisão, looping
exception
    try catch
end;

Exibindo uma linha (print)
begin
    dbms_output.put_line('Olá');
end;

Concatenando ( || )
begin
    dbms_output.put_line('Olá '||'Fiap');
end;

Calculando sem variáveis de memória
begin
    dbms_output.put_line(100+30);
end;

Usando variáveis
declare
v_nome varchar(10) := 'Fiap';
v_cod number(4) := 1000;
begin
    dbms_output.put_line(v_nome || ' - ' || v_cod);
end;

Herança de estrutura, tipo e tamanho
declare
v_nome varchar(10) := 'Fiap';
v_nome1 v_nome%type := 1000;
begin
    dbms_output.put_line(v_nome || ' - ' || v_nome1);
end;

Entrada de dados em tempo de execução
declare
v_nome varchar(10) := '&nome';
v_nome1 v_nome%type := '&nome1';
begin
    dbms_output.put_line(v_nome || ' - ' || v_nome1);
end;