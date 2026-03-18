-- Nicholas Albuquerque Buzo - RM 561082

-- Criando tabela produtos
DROP TABLE produtos cascade constraints;
CREATE TABLE produtos (
 id_produto NUMBER(2) PRIMARY KEY,
 nome VARCHAR2(100),
 preco NUMBER(10,2),
 quantidade NUMBER(8,2));

-- Crie um PL/SQL para inclusão de 5 linhas de dados:
insert into produtos(id_produto, nome, preco, quantidade) values (1,'Mouse', 80, 5);
insert into produtos(id_produto, nome, preco, quantidade) values (2,'Teclado', 100, 3);
insert into produtos(id_produto, nome, preco, quantidade) values (3,'SSD', 350, 1);
insert into produtos(id_produto, nome, preco, quantidade) values (4,'Monitor', 500, 5);
insert into produtos(id_produto, nome, preco, quantidade) values (5,'Gabinete', 200, 6);

-- Crie um bloco PL/SQL que simule o processo de venda de um produto:
Declare
    -- Declarando as variáveis
    v_id number(2) := &id;
    qtd_compra number(8, 2) := &qtd;
    v_quantidade number(8, 2);
    v_nome varchar2(100);
    v_preco number(10, 2);
    preco_total number (10, 2);
Begin
    -- Verificando existência dos produtos pelo range da tabela
    if v_id > 0 and v_id <= 5 then
        -- Passando dados da tabela para as variáveis anteriormente criadas
        select nome into v_nome from produtos where id_produto = v_id;
        select quantidade into v_quantidade from produtos where id_produto = v_id;
        select preco into v_preco from produtos where id_produto = v_id;
        
            -- Verificando se quantidade comprada é compatível com estoque disponível
            if qtd_compra <= v_quantidade then
                preco_total := qtd_compra * v_preco; -- Calculando o preço total
                -- Adicionando desconto de 10% para compras acima de cinco unidades
                if qtd_compra > 5 then
                preco_total := preco_total * 0.9; -- Calculando total com desconto
                end if;
                
            -- Atualizando o estoque de acordo com a quantidade comprada
            UPDATE produtos set QUANTIDADE = v_quantidade - qtd_compra 
                where id_produto = v_id;
            
            -- Exibindo as informações da compra
            dbms_output.put_line('Produto comprado: ' || v_nome);
            dbms_output.put_line('Quantidade comprada: ' || qtd_compra);
            dbms_output.put_line('Valor total R$' || preco_total);
            dbms_output.put_line('Venda realizada com sucesso!');    
            else
            -- Exibindo mensagem caso o estoque seja insuficiente
            dbms_output.put_line('Estoque insuficiente');
            end if;
        else
        -- Exibindo mensagem caso o id do produto não exista
        dbms_output.put_line('Produto não encontrado');
    end if;
End;

select * from produtos;