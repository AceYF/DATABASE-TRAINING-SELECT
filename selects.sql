DROP DATABASE db_livraria;
create database db_livraria;

use db_livraria;

DROP TABLE IF EXISTS tb_categoria;
create table tb_categoria(
cd_categoria int not null,
nm_categoria varchar(30),
constraint pk_categoria
	primary key(cd_categoria)
);

DROP TABLE IF EXISTS tb_autor;
create table tb_autor(
cd_autor int not null,
nm_autor varchar(50),
sobrenome_autor varchar(50),
constraint pk_autor
	primary key(cd_autor)
);

DROP TABLE IF EXISTS tb_pais;
create table tb_pais(
cd_pais int not null,
nm_pais varchar(30),
constraint pk_pais
	primary key(cd_pais)
);

DROP TABLE IF EXISTS tb_editora;
create table tb_editora(
cd_editora int not null,
nm_editora varchar(30),
cd_pais int,
constraint pk_editora
	primary key(cd_editora),
constraint fk_editora_pais
	foreign key(cd_pais)
		references tb_pais(cd_pais)
);

DROP TABLE IF EXISTS tb_livro;
create table tb_livro(
cd_livro int not null,
nm_livro varchar(30),
ano_publicacao char(4),
vl_compra decimal(7,2) default 0.00,
vl_venda decimal(7,2) default 0.00,
qt_estoque int(4),
isbn varchar(13),
cd_categoria int,
cd_editora int,
constraint pk_livro
	primary key(cd_livro),
constraint fk_livro_categoria
	foreign key(cd_categoria)
		references tb_categoria(cd_categoria),
constraint fk_livro_editora
	foreign key(cd_editora)
		references tb_editora(cd_editora)
);

DROP TABLE IF EXISTS tb_livro_autor;
create table tb_livro_autor(
cd_livro int,
cd_autor int,
constraint fk_livro_autor_livro
	foreign key(cd_livro)
		references tb_livro(cd_livro),
constraint fk_livro_autor_autor
	foreign key(cd_autor)
		references tb_autor(cd_autor)
);

insert into tb_categoria 
	(cd_categoria, nm_categoria)
values
	(1,'Romance'),
	(2,'Suspense'),
	(3,'Drama'),
	(4,'Biografia'),
	(5,'Autobiografia'),
	(6,'Conto'),
	(7,'Terror'),
	(8,'Ficção'),
	(9,'Infantil'),
	(10,'Poesia'),
	(11,'Fábula'),
	(12,'Novela'),
	(13,'Crônica');
	
insert into tb_autor
	(cd_autor, nm_autor, sobrenome_autor)
values
	(1,'Joaquim Carlos','Fernandes'),
	(2,'Maria de Fátima','Antunes'),
	(3,'Leonardo dos','Anjos'),
	(4,'Tereza','Farias'),
	(5,'Katya Thaysa','di Gianny'),
	(6,'Marcelo Pereira','Sousa'),
	(7,'Heitor Assis','Vilanova'),
	(8,'Angelica Martins','Oliveira'),
	(9,'Paulo Dias','Otaviano'),
	(10,'Rita de Souza','Andrade'),
	(11,'Cássio André da','Silva'),
	(12,'Tomás Rodrigues','Alves'),
	(13,'Vitoria Gomes das','Neves'),
	(14,'Kauan Ferreira','Azevedo'),
	(15,'Otávio Rocha','Barros'),
	(16,'Lucas','Cavalcanti'),
	(17,'Gabrielly Pinto Sales','Fernandes'),
	(18,'Carolina Cunha','Santos'),
	(19,'Bruno','Barbosa'),
	(20,'Breno Diego','Carreia'),
	(21,'Matilde Ribeiro','Cavalcanti'),
	(22,'Rodrigo Lima','Costa');

	
insert into tb_pais
	(cd_pais, nm_pais)
values
	(1,'Brasil'),
	(2,'França'),
	(3,'Itália'),
	(4,'Estados Unidos'),
	(5,'Argentina'),
	(6,'Espanha'),
	(7,'Alemanha');

insert into tb_editora
	(cd_editora, nm_editora, cd_pais)
values
	(1,'Algaroba',5),
	(2,'Nativus',4),
	(3,'A Letra',1),
	(4,'Piacere',3),
	(5,'Baska',6),
	(6,'La Magie',2),
	(7,'Gambaro',3),
	(8,'Astro',1),
	(9,'Terra',1),
	(10,'Allora',3);

insert into tb_livro
	(cd_livro, nm_livro, ano_publicacao, vl_compra, vl_venda, qt_estoque, isbn, cd_categoria, cd_editora)
values
	(1,'A mente das mentes',2009,21.41,27.83,36,9781984154188,8,2),
	(2,'O preço das vontades',1979,50.42,65.55,34,7534463719,2,8),
	(3,'Eu quis, eu fiz',1995,35.93,46.71,18,7423497506,11,2),
	(4,'Cadê os fantasmas',2017,26.39,34.31,40,9782799870643,7,7),
	(5,'Adormeci pensando em você',2016,43.13,56.07,30,2282262775,1,3),
	(6,'O reino encantado das fadas',1992,40.38,52.49,14,1314595722,9,1),
	(7,'Tereza por Tereza',2004,27.30,35.49,11,2161552790,5,7),
	(8,'A casa fantástica',2014,24.31,31.60,24,9785416331754,6,3),
	(9,'O cálice de sangue',1995,42.20,54.86,18,8784232097,3,1),
	(10,'A morte pede passagem',2010,33.78,43.91,24,9788834801663,7,1),
	(11,'Brincando de ser feliz',1991,44.10,57.33,28,5655977156,11,2),
	(12,'Nós, vós, eles',1995,28.37,36.88,43,8703191093,4,1),
	(13,'Amor meu grande amor',2000,25.60,33.28,6,6277478358,1,9),
	(14,'A formiga de chapéu',2010,38.75,50.38,23,9781372489299,9,9),
	(15,'Eu vi o que você fez na praia',1959,18.15,23.60,37,7217237078,7,1),
	(16,'A batida perfeita',2009,21.79,28.33,13,9782676255914,13,7),
	(17,'O tempo cobra',2000,43.90,57.07,45,9264067834,2,1),
	(18,'As marcas da caçada',1970,17.90,23.27,31,9671574076,3,4),
	(19,'Felicidade',1987,28.52,37.08,22,7093982362,11,4),
	(20,'Amigo não mente',1968,27.77,36.10,30,9140733949,6,3),
	(21,'O conquistador de almas',2005,30.68,39.88,15,3015032329,8,4),
	(22,'Acredite em você',2020,42.76,55.59,25,9784226831302,4,8),
	(23,'Por traz da maquiagem',1957,18.77,24.40,6,1167762864,5,5),
	(24,'Hoje o céu está preto',1997,42.10,54.73,48,8538762723,6,9),
	(25,'A porquinha cor de rosa',2007,21.63,28.12,9,9788601323155,9,9),
	(26,'Os sonhos dos inocentes',2002,43.40,56.42,34,3176409018,13,6),
	(27,'A geração omega',1971,30.22,39.29,11,4371973427,8,9),
	(28,'Cavalo de fogo',2012,34.70,45.11,23,9781748195923,10,2),
	(29,'Estranhos sinais',2005,17.15,22.30,23,1635523211,3,8),
	(30,'Caminhos fatais',1960,48.61,63.19,17,2703508274,7,2),
	(31,'Portal para Chinatown',2020,39.27,51.05,45,9789321176975,6,6),
	(32,'Batidas, feridas e sangue',2001,24.26,31.54,8,4211864580,3,5),
	(33,'Quem está aí',1981,37.68,48.98,9,2756412924,2,8),
	(34,'Cheiro de bebê',2011,36.93,48.01,26,9782134961350,7,7),
	(35,'Cristais quebrados',1967,28.55,37.12,30,3054005488,1,5),
	(36,'Tartaruga Dim Dim',2006,26.78,34.81,23,9002315782,9,7);

insert into tb_livro_autor
	(cd_livro, cd_autor)
values
	(1,11),
	(2,7),
	(2,17),
	(2,13),
	(3,3),
	(4,5),
	(5,14),
	(6,11),
	(7,4),
	(8,19),
	(8,9),
	(9,8),
	(10,8),
	(11,3),
	(12,10),
	(13,17),
	(13,1),
	(14,6),
	(15,8),
	(16,21),
	(17,10),
	(18,16),
	(18,21),
	(19,16),
	(20,7),
	(21,20),
	(22,14),
	(23,18),
	(24,13),
	(25,6),
	(25,9),
	(25,14),
	(26,22),
	(27,7),
	(27,13),
	(28,11),
	(29,19),
	(30,3),
	(31,2),
	(32,12),
	(33,17),
	(34,20),
	(35,18),
	(36,21);
    
select tb_editora.nm_editora, tb_pais.nm_pais
	from tb_editora join tb_pais;
        
select cd_categoria as "Categoria Terror",
    count(*) as Quantidade
		from tb_livro 
			where cd_categoria like "7";

select * from tb_editora join tb_livro
	on tb_editora.cd_editora = tb_livro.cd_editora
		where ano_publicacao <= 2000;

select nm_livro, nm_editora, qt_estoque
	from tb_editora join tb_livro
		on tb_editora.cd_editora = tb_livro.cd_editora
			where qt_estoque > 32;
            
select nm_livro, nm_autor, sobrenome_autor
	from tb_autor join tb_livro_autor
		on tb_autor.cd_autor = tb_livro_autor.cd_autor
			join tb_livro
				on tb_livro.cd_livro = tb_livro_autor.cd_livro
					where sobrenome_autor like "%R%";
                    
select nm_editora, nm_categoria
	from tb_livro join tb_categoria
		on tb_livro.cd_categoria = tb_categoria.cd_categoria
			join tb_editora
				on tb_editora.cd_editora = tb_livro.cd_editora
					where nm_categoria like "Drama";
                    
select tb_autor.nm_autor, tb_categoria.nm_categoria
	from tb_autor join tb_categoria
		where nm_autor like "C%";
                    
select a.nm_autor, p.nm_pais, e.nm_editora
	from tb_autor as a, tb_pais as p, tb_editora as e
		where e.cd_pais = p.cd_pais
			and nm_pais like "Brasil";
                            
select l.nm_livro, l.ano_publicacao, l.isbn, a.nm_autor, a.sobrenome_autor, c.nm_categoria, e.nm_editora, e.cd_pais
	from tb_livro as l, tb_autor as a, tb_pais as p, tb_categoria as c, tb_editora as e
			where e.cd_pais = p.cd_pais
				and qt_estoque between 20 and 40;
            


