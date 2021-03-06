-- EVEN_CD_TIPO:
-- 1 - FUTEBOL
-- 2 - SHOW
-- 3 - TEATRO
-- 4 - CINEMA
-- 5 - LUTA


-- FUTEBOL ###########################################################################

INSERT INTO FI_CD_EVENTO_EVEN 
(ID_EVEN_CD_EVENTO, EVEN_CD_TIPO, EVEN_DH_EVENTO, EVEN_DS_DESCRICAO, EVEN_DS_LOCAL, EVEN_DS_TITULO) 
SELECT MAX(ID_EVEN_CD_EVENTO) + 1, '1', '01/12/2016', 
'Jogo novo. Descricao 123 123 123.',
'Alianz Park', '15 de Piri Piri x Jau'
FROM FI_CD_EVENTO_EVEN;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Setor 1', 3, 100.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Setor 2', 3, 70.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Setor 3', 3, 40.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;



-- SHOWS ####################################################################################

INSERT INTO FI_CD_EVENTO_EVEN 
(ID_EVEN_CD_EVENTO, EVEN_CD_TIPO, EVEN_DH_EVENTO, EVEN_DS_DESCRICAO, EVEN_DS_LOCAL, EVEN_DS_TITULO) 
SELECT MAX(ID_EVEN_CD_EVENTO) + 1, '2', '14/11/2016', 
'Show novo. Descricao 123 123',
'Ibirapuera', 'Metallica'
FROM FI_CD_EVENTO_EVEN;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Premium', 3, 900.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Cadeira Azul', 3, 300.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Camarote', 3, 250.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Pista', 3, 150.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;



-- TEATROS ####################################################################################

INSERT INTO FI_CD_EVENTO_EVEN 
(ID_EVEN_CD_EVENTO, EVEN_CD_TIPO, EVEN_DH_EVENTO, EVEN_DS_DESCRICAO, EVEN_DS_LOCAL, EVEN_DS_TITULO) 
SELECT MAX(ID_EVEN_CD_EVENTO) + 1, '3', '27/03/2016', 
'Teatro novo. Descricao 123 123 123.',
'Sesc Pinheiros', 'O Coice'
FROM FI_CD_EVENTO_EVEN;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Inteira', 3, 200.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Meia', 3, 100.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;




-- CINEMA ####################################################################################

INSERT INTO FI_CD_EVENTO_EVEN 
(ID_EVEN_CD_EVENTO, EVEN_CD_TIPO, EVEN_DH_EVENTO, EVEN_DS_DESCRICAO, EVEN_DS_LOCAL, EVEN_DS_TITULO) 
SELECT MAX(ID_EVEN_CD_EVENTO) + 1, '4', '11/02/2016', 
'Cinema novo. Descricao 123 123 123',
'Shopping Tatuape', 'A Mosca'
FROM FI_CD_EVENTO_EVEN;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Inteira', 3, 40.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Meia', 3, 20.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;



-- LUTAS ###################################################################################

INSERT INTO FI_CD_EVENTO_EVEN 
(ID_EVEN_CD_EVENTO, EVEN_CD_TIPO, EVEN_DH_EVENTO, EVEN_DS_DESCRICAO, EVEN_DS_LOCAL, EVEN_DS_TITULO) 
SELECT MAX(ID_EVEN_CD_EVENTO) + 1, '5', '11/09/2016', 
'Luta nova. Descricao 123 123 123',
'Ibirapuera', 'UFC 555'
FROM FI_CD_EVENTO_EVEN;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'VIP', 3, 4000.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Premium', 3, 1000.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Camarote 1', 3, 500.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Camarote 2', 3, 400.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;

INSERT INTO FI_CD_TICKET_TICK
(ID_TICK_CD_TICKET, TICK_DS_DESCRICAO, TICK_NR_DISPONIVEL, TICK_NR_VALOR, ID_EVEN_CD_EVENTO)
SELECT MAX(ID_TICK_CD_TICKET) + 1, 'Cadeira', 3, 200.0,
(SELECT MAX(ID_EVEN_CD_EVENTO) FROM FI_CD_EVENTO_EVEN) FROM FI_CD_TICKET_TICK;



-- NUMERADORAS

UPDATE FI_NG_NUMERADORA_NUME 
SET NUME_NR_NEXTVAL = (SELECT MAX(ID_EVEN_CD_EVENTO) + 1 FROM FI_CD_EVENTO_EVEN)
WHERE NUME_DS_ENTITY = 'FiCdEventoEven';

UPDATE FI_NG_NUMERADORA_NUME 
SET NUME_NR_NEXTVAL = (SELECT MAX(ID_EVEN_CD_EVENTO) + 1 FROM FI_CD_EVENTO_EVEN)
WHERE NUME_DS_ENTITY = 'FiCdTicketTick';
