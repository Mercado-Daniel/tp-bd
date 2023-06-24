create database Tp_base_de_datos;
use tp_base_de_datos;
-- Tabla pelicula
create table pelicula(
id int primary key,
titulo varchar(100) not null,
director_id int not null,
duracion integer not null,
fecha_estreno date not null,
titulo_espaniol varchar(100) not null);

-- tabla idioma_original
create table idioma_original(
id int primary key,
idioma varchar(100) not null);

-- tabla idioma_original_pelicula
create table idioma_original_pelicula(
pelicula_id int not null,
idioma_original_id int not null,
foreign key (pelicula_id) references pelicula(id),
foreign key (idioma_original_id) references idioma_original(id),
primary key (pelicula_id, idioma_original_id));

-- tabla actor
create table actor(
id int primary key,
nombre varchar(100) not null);

-- tabla actor_pelicula
create table actor_pelicula(
pelicula_id int not null,
actor_id int not null,
foreign key (pelicula_id) references pelicula(id),
foreign key (actor_id) references actor(id),
primary key (pelicula_id, actor_id));

-- tabla director
create table director (
id int primary key,
nombre varchar(100) not null);

-- asigno fk de director a pelicula.director_id
alter table pelicula
add constraint fk_pelicula_director
foreign key (director_id)
references director (id);

-- tabla genero
create table genero (
id int primary key,
nombre varchar(100) not null);

-- tabla genero_pelicula
	create table genero_pelicula(
    pelicula_id int,
    genero_id int,
    foreign key (pelicula_id) references pelicula(id),
    foreign key (genero_id) references genero(id),
    primary key (pelicula_id, genero_id));
    
-- premio
create table premio(
id int primary key,
nombre varchar(100));
-- pelicula_premio
create table pelicula_premio(
pelicula_id int not null, 
premio_id int not null,
cantidad_ganados int,
foreign key (pelicula_id) references pelicula(id),
foreign key (premio_id) references premio(id),
primary key (pelicula_id, premio_id));


-- saga
create table saga(
id int primary key,
nombre varchar(100));

-- saga_pelicula se encarga de conectar saga con pelicula si una pelicula pertenecea a una saga (tiene mas de una parte)
create table saga_pelicula(
pelicula_id int,
saga_id int,
orden int not null,
foreign key (pelicula_id) references pelicula(id),
foreign key (saga_id) references saga(id),
primary key (pelicula_id, saga_id)); -- asigno la combinacion de claves foraneas para obtener la clave primaria

-- cargo generos
insert into genero (id, nombre)
values (1, 'fantasia');

insert into genero (id, nombre)
values (2, 'animacion');

insert into genero (id, nombre)
values (3, 'ciencia ficcion');

insert into genero (id, nombre)
values (4, 'comedia');

insert into genero (id, nombre)
values (5, 'drama');

insert into genero (id, nombre)
values (6, 'aventura');

insert into genero (id, nombre)
values (7, 'accion');

insert into genero (id, nombre)
values (8, 'historica');

insert into genero (id, nombre)
values (9, 'romance');

-- cargo directores
insert into director (id, nombre)
values (1, 'Robert Zemeckis');

insert into director (id, nombre)
values (2, 'George Lucas');

insert into director (id, nombre)
values (3, 'Hayao Miyazaki');

insert into director (id, nombre)
values (4, 'Pete Docter');

insert into director (id, nombre)
values (5, 'Mel Gibson');

insert into director (id, nombre)
values (6, 'Steven Spielberg');

insert into director (id, nombre)
values (7, 'Joe Johnston');

insert into director(id, nombre)
values (8, 'James Cameron');

insert into director(id, nombre)
values (9, 'Irvin Kershner');

insert into director(id, nombre)
values(10, 'Richard Marquand');

insert into director(id, nombre)
values(11, 'J.J. Abrams');

insert into director(id, nombre)
values (12, 'Garreth Edwards');

insert into director(id, nombre)
values (13, 'Ron Howard');

insert into director(id, nombre)
values (14, 'Jake Kasdan');

insert into director(id, nombre)
values (15, 'Rian Johnson');
select * from director;

-- cargo actores
insert into actor (id, nombre)
values (1, 'Leonardo DiCaprio');

insert into actor (id, nombre)
values (2, 'Kate Winslet');

insert into actor (id, nombre)
values (3, 'Mark Hamill');

insert into actor (id, nombre)
values (4, 'Carrie Fisher');

insert into actor (id, nombre)
values (5, 'Harrison Ford');

insert into actor (id, nombre)
values (6, 'Mel Gibson');

insert into actor (id, nombre)
values (7, 'Sophie Marceau');

insert into actor (id, nombre)
values (8, 'Patrick McGoohan');

insert into actor (id, nombre)
values (9, 'Michael J. Fox');

insert into actor (id, nombre)
values (10, 'Cristofer Lloyd');

insert into actor (id, nombre)
values (11, 'Lea Thompson');

insert into actor (id, nombre)
values (12, 'Crispin Glover');

insert into actor (id, nombre)
values (13, 'Tom Hanks');

insert into actor (id, nombre)
values (14, 'Robin Wright');

insert into actor (id, nombre)
values (15, 'Gary Sinise');

insert into actor (id, nombre)
values (16, 'Bob Hoskins');

insert into actor (id, nombre)
values (17, 'Sean Connery');

insert into actor (id, nombre)
values (18, 'Robin Williams');

insert into actor (id, nombre)
values (19, 'Kirsten Dunst');

insert into actor (id, nombre)
values (20, 'Bradley Pierce');

insert into actor (id, nombre)
values (21, 'Bonnie Hunt');

insert into actor (id, nombre)
values (22, 'Liam Neeson');

insert into actor (id, nombre)
values (23, 'Ewan McGregor');

insert into actor (id, nombre)
values (24, 'Natali Portman');

insert into actor (id, nombre)
values (25, 'Jake Lloyd');

insert into actor (id, nombre)
values (26, 'Christopher Lee');

insert into actor (id, nombre)
values (27, 'Hayden Christensen');

insert into actor (id, nombre)
values (28, 'Adam Driver');

insert into actor (id, nombre)
values (29, 'Daisy Ridley');

insert into actor (id, nombre)
values (30, 'John Boyega');

insert into actor (id, nombre)
values (32, 'Felicity Jones');

insert into actor (id, nombre)
values (33, 'Diego Luna');

insert into actor (id, nombre)
values (34, 'Alan Tudyk');

insert into actor (id, nombre)
values (31, 'Donnie Yen');

insert into actor (id, nombre)
values (35, 'Alde Ehrenreich');

insert into actor (id, nombre)
values (36, 'Joonas Suotamo');

insert into actor (id, nombre)
values (37, 'Woody Harrelson');

insert into actor (id, nombre)
values (38, 'Valeria Clarke');

insert into actor (id, nombre)
values (39, 'Dwayne Johnson');

insert into actor (id, nombre)
values (40, 'Kevin Hart');

insert into actor (id, nombre)
values (41, 'Jack Black');

insert into actor (id, nombre)
values (42, 'Karen Gillan');

insert into actor (id, nombre)
values (43, 'Karen Allen');

insert into actor (id, nombre)
values (44, 'Kate Capshaw');

insert into actor (id, nombre)
values (45, 'Shia LaBeouf');


-- cargo idiomas
insert into idioma_original (id, idioma)
values(1, 'ingles');
insert into idioma_original (id, idioma)
values(2, 'japones');
insert into idioma_original (id, idioma)
values(3, 'frances');
insert into idioma_original (id, idioma)
values(4, 'latin');
insert into idioma_original (id, idioma)
values(5, 'aleman');
insert into idioma_original (id, idioma)
values(6, 'griego');
insert into idioma_original (id, idioma)
values(7,'Sinhalese');
insert into idioma_original (id, idioma)
values(8, 'Chino');
insert into idioma_original (id, idioma)
values(9, 'Arabe');
insert into idioma_original (id, idioma)
values(10, 'Nepali');
insert into idioma_original (id, idioma)
values(11, 'Hebreo');
insert into idioma_original (id, idioma)
values(12, 'Español');

-- cargo peliculas
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(1,'Star Wars: Episode IV – A New Hope', 2, 121, '1977-05-25','Star Wars: Episodio IV - Una nueva esperanza');
-- asigno actores a la pelicula
-- star wars 4
insert into actor_pelicula (pelicula_id, actor_id)
values(1, 3);
insert into actor_pelicula (pelicula_id, actor_id)
values(1, 4);
insert into actor_pelicula (pelicula_id, actor_id)
values(1, 5);
-- asigno generos a star wars 4
insert into genero_pelicula(pelicula_id, genero_id)
values(1,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(1,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(1,3);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(1, 1);

-- titanic
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(2,'Titanic', 8, 194, '1997-12-18','Titanic');
-- cargo los actores
insert into actor_pelicula(pelicula_id, actor_id)
values(2, 1);
insert into actor_pelicula(pelicula_id, actor_id)
values(2,2);
-- cargo los generos de titanic
insert into genero_pelicula(pelicula_id, genero_id)
values(2,5);
insert into genero_pelicula(pelicula_id, genero_id)
values(2,9);
insert into genero_pelicula(pelicula_id, genero_id)
values(2,8);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(2, 1);

-- Sen to Chihiro no Kamikakushi, el viaje de chihiro
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(3,'Sen to Chihiro no Kamikakushi', 3, 125, '2001-07-20','El Viaje de Chihiro');
-- ingreso los generos a Sen to Chihiro no Kamikakushi
insert into genero_pelicula(pelicula_id, genero_id)
values(3,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(3,2);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(3, 2);

-- Inside Out
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(4, 'Inside Out', 4, 102, '2015-05-18','Intensa-Mente');
-- cargo los generos de Inside Out
insert into genero_pelicula(pelicula_id, genero_id)
values(4,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(4,2);
insert into genero_pelicula(pelicula_id, genero_id)
values(4,4);
insert into genero_pelicula(pelicula_id, genero_id)
values(4,5);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(4, 1);

-- Braveheart
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(5,'Braveheart',  5, 177, '1995-05-24', 'Corazon valiente');
-- cargo los actores
insert into actor_pelicula(pelicula_id, actor_id)
values(5, 6);
insert into actor_pelicula(pelicula_id, actor_id)
values(5, 7);
insert into actor_pelicula(pelicula_id, actor_id)
values(5, 8);
-- cargo los generos
insert into genero_pelicula(pelicula_id, genero_id)
values(5,7);
insert into genero_pelicula(pelicula_id, genero_id)
values(5,5);
insert into genero_pelicula(pelicula_id, genero_id)
values(5,8);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(5, 1);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(5, 3);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(5, 4);

-- Back to the Future
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(6, 'Back to the Future', 1, 111, '1985-07-03', 'Volver al Futuro' ); 
-- agrego los actores
insert into actor_pelicula (pelicula_id, actor_id)
values(6, 9);
insert into actor_pelicula (pelicula_id, actor_id)
values(6, 10);
insert into actor_pelicula (pelicula_id, actor_id)
values (6, 11);
insert into actor_pelicula (pelicula_id, actor_id)
values (6, 12);
-- agrego los generos
insert into genero_pelicula (pelicula_id, genero_id)
values(6, 6);
insert into genero_pelicula (pelicula_id, genero_id)
values(6, 4);
insert into genero_pelicula (pelicula_id, genero_id)
values(6, 3);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(6, 1);

-- Forrest Gump
insert into pelicula (id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(7, 'Forrest Gump', 1, 142, '1994-06-23', 'Forrest Gump');
-- agrego los actores
insert into actor_pelicula (pelicula_id, actor_id)
values(7, 13);
insert into actor_pelicula (pelicula_id, actor_id)
values(7, 14);
insert into actor_pelicula (pelicula_id, actor_id)
values(7, 15);
-- agrego los generos
insert into genero_pelicula (pelicula_id, genero_id)
values(7, 4);
insert into genero_pelicula (pelicula_id, genero_id)
values(7, 5);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(7, 1);

-- Who Framed Roger Rabbit
insert into pelicula (id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(8, 'Who Framed Roger Rabbit', 1, 103,'1988-06-21', '¿Quién engañó a Roger Rabbit?');
-- cargo los actores
insert into actor_pelicula (pelicula_id, actor_id)
values(8, 16);
insert into actor_pelicula (pelicula_id, actor_id)
values(8, 10);
-- cargo los generos
insert into genero_pelicula(pelicula_id, genero_id)
values(8, 2);
insert into genero_pelicula(pelicula_id, genero_id)
values(8, 4);
insert into genero_pelicula(pelicula_id, genero_id)
values(8, 5);
insert into genero_pelicula(pelicula_id, genero_id)
values(8, 9);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(8, 1);

-- cargo Indiana Jones and the Last Crusade
insert into pelicula (id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values (9, 'Indiana Jones and the Last Crusade', 6, 127, '1989-05-24','Indiana Jones y la última cruzada');
-- agrego los actores
insert into actor_pelicula(pelicula_id, actor_id)
values(9, 5);
insert into actor_pelicula(pelicula_id, actor_id)
values(9, 17);
-- agrego las categorias
insert into genero_pelicula(pelicula_id, genero_id)
values(9, 7);
insert into genero_pelicula(pelicula_id, genero_id)
values(9, 6);
insert into genero_pelicula(pelicula_id, genro_id)
values(9, 4);
-- agrego los idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(9, 1);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(9, 5);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(9, 6);

-- Jumanji
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values (10,'Jumanji', 7, 101, '1995-12-15', 'Jumanji');
-- agrego actores
insert into actor_pelicula(pelicula_id, actor_id)
values(10, 18);
insert into actor_pelicula(pelicula_id, actor_id)
values(10, 19);
insert into actor_pelicula(pelicula_id, actor_id)
values(10, 20);
insert into actor_pelicula(pelicula_id, actor_id)
values(10, 21);
-- agrego generos
insert into genero_pelicula(pelicula_id, genero_id)
values(10, 4);
insert into genero_pelicula(pelicula_id, genero_id)
values(10, 1);
-- agrego idioma
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(10, 1);

-- cargo peliculas
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(11,'Star Wars: Episode V - The Empire Strikes Back', 9, 124, '1980-05-21','Star Wars: El Imperio Contrataca');
-- asigno actores a la pelicula
-- star wars 5
insert into actor_pelicula (pelicula_id, actor_id)
values(11, 3);
insert into actor_pelicula (pelicula_id, actor_id)
values(11, 4);
insert into actor_pelicula (pelicula_id, actor_id)
values(11, 5);
-- asigno generos a star wars 5
insert into genero_pelicula(pelicula_id, genero_id)
values(11,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(11,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(11,3);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(11, 1);

-- cargo peliculas
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(12,'Star Wars: Episode VI - Return of the Jedi', 10, 135, '1983-05-25','Star Wars: El Retorno del Jedi');
-- asigno actores a la pelicula
-- star wars 6
insert into actor_pelicula (pelicula_id, actor_id)
values(12, 3);
insert into actor_pelicula (pelicula_id, actor_id)
values(12, 4);
insert into actor_pelicula (pelicula_id, actor_id)
values(12, 5);
-- asigno generos a star wars 6
insert into genero_pelicula(pelicula_id, genero_id)
values(12,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(12,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(12,3);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(12, 1);


-- star wars 1
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(13,'Star Wars: Episode I - The Phantom Menace', 2, 133, '1999-05-19','Star Wars: La Amenaza Fantasma');
-- asigno actores a la pelicula
-- star wars 1
insert into actor_pelicula (pelicula_id, actor_id)
values(13, 22);
insert into actor_pelicula (pelicula_id, actor_id)
values(13, 23);
insert into actor_pelicula (pelicula_id, actor_id)
values(13, 24);
insert into actor_pelicula(pelicula_id, actor_id)
values(13, 25);
-- asigno generos a star wars 1
insert into genero_pelicula(pelicula_id, genero_id)
values(13,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(13,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(13,3);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(13, 1);

-- star wars 2
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(14,'Star Wars: Episode II - Attack of the Clones', 2, 142, '2002-05-16','Star Wars: La Guerra De Los Clones');
-- asigno actores a la pelicula
-- star wars 2
insert into actor_pelicula (pelicula_id, actor_id)
values(14, 27);
insert into actor_pelicula (pelicula_id, actor_id)
values(14, 23);
insert into actor_pelicula (pelicula_id, actor_id)
values(14, 24);
insert into actor_pelicula(pelicula_id, actor_id)
values(14, 26);
-- asigno generos a star wars 2
insert into genero_pelicula(pelicula_id, genero_id)
values(14,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(14,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(14,3);
insert into genero_pelicula(pelicula_id, genero_id)
values(14,7);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(14, 1);

-- star wars 3
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(15,'Star Wars: Episode III - Revenge of the Sith', 2, 140, '2005-05-19','Star Wars: La Venganza de los Sith');
-- asigno actores a la pelicula
-- star wars 3
insert into actor_pelicula (pelicula_id, actor_id)
values(15, 27);
insert into actor_pelicula (pelicula_id, actor_id)
values(15, 23);
insert into actor_pelicula (pelicula_id, actor_id)
values(15, 24);
-- asigno generos a star wars 2
insert into genero_pelicula(pelicula_id, genero_id)
values(15,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(15,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(15,3);
insert into genero_pelicula(pelicula_id, genero_id)
values(15,7);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(15, 1);

-- star wars 7
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(16,'Star Wars: The Force Awakens', 11, 136, '2015-12-14','Star Wars: el despertar de la fuerza');
-- asigno actores a la pelicula
-- star wars 7
insert into actor_pelicula (pelicula_id, actor_id)
values(16, 5);
insert into actor_pelicula (pelicula_id, actor_id)
values(16, 28);
insert into actor_pelicula (pelicula_id, actor_id)
values(16, 29);
insert into actor_pelicula (pelicula_id, actor_id)
values(16, 30);
-- asigno generos a star wars 2
insert into genero_pelicula(pelicula_id, genero_id)
values(16,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(16,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(16,3);
insert into genero_pelicula(pelicula_id, genero_id)
values(16,7);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(16, 1);

-- star wars
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(17,'Rogue One: A Star Wars Story', 12, 133, '2016-12-10','Rogue One: una historia de Star Wars');
-- asigno actores a la pelicula
-- star wars 
insert into actor_pelicula (pelicula_id, actor_id)
values(17, 32);
insert into actor_pelicula (pelicula_id, actor_id)
values(17, 33);
insert into actor_pelicula (pelicula_id, actor_id)
values(17, 34);
insert into actor_pelicula (pelicula_id, actor_id)
values(17, 31);
-- asigno generos a star wars 
insert into genero_pelicula(pelicula_id, genero_id)
values(17,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(17,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(17,3);
insert into genero_pelicula(pelicula_id, genero_id)
values(17,7);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(17, 1);

-- peliculas

insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(18,'Star Wars: The Last Jedi', 15, 152,'2017-12-09','Star Wars: Episodio VIII - Los ultimos Jedi');
-- asigno actores a la pelicula
-- star wars 
insert into actor_pelicula (pelicula_id, actor_id)
values(18, 3);
insert into actor_pelicula (pelicula_id, actor_id)
values(18, 4);
insert into actor_pelicula (pelicula_id, actor_id)
values(18, 28);
insert into actor_pelicula (pelicula_id, actor_id)
values(18, 29);
-- asigno generos a star wars 
insert into genero_pelicula(pelicula_id, genero_id)
values(18,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(18,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(18,3);
insert into genero_pelicula(pelicula_id, genero_id)
values(18,7);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(18, 1);

insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(19,'Solo: A Star Wars Story', 13,135,'2018-05-10','Solo: una historia de Star Wars');
-- asigno actores a la pelicula
-- star wars 
insert into actor_pelicula (pelicula_id, actor_id)
values(19, 35);
insert into actor_pelicula (pelicula_id, actor_id)
values(19, 36);
insert into actor_pelicula (pelicula_id, actor_id)
values(19, 37);
insert into actor_pelicula (pelicula_id, actor_id)
values(19, 38);
-- asigno generos a star wars 
insert into genero_pelicula(pelicula_id, genero_id)
values(19,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(19,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(19,3);
insert into genero_pelicula(pelicula_id, genero_id)
values(19,7);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(19, 1);

insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(20,'Star Wars: The Rise of Skywalker', 11,155,'2019-12-16','Star Wars: Episodio IX - El ascenso de Skywalker');

-- asigno actores a la pelicula
-- star wars 
insert into actor_pelicula (pelicula_id, actor_id)
values(20, 28);
insert into actor_pelicula (pelicula_id, actor_id)
values(20, 29);
insert into actor_pelicula (pelicula_id, actor_id)
values(20, 30);
-- asigno generos a star wars 
insert into genero_pelicula(pelicula_id, genero_id)
values(20,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(20,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(20,3);
insert into genero_pelicula(pelicula_id, genero_id)
values(20,7);
-- cargo idiomas
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(20, 1);


insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(21,'Back to the Future Part II', 1,108,'1989-11-22','Volver al futuro II');
insert into actor_pelicula (pelicula_id, actor_id)
values(21, 9);
insert into actor_pelicula (pelicula_id, actor_id)
values(21, 10);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(21, 1);
insert into genero_pelicula(pelicula_id, genero_id)
values(21,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(21,4);
insert into genero_pelicula(pelicula_id, genero_id)
values(21,3);
insert into genero_pelicula(pelicula_id, genero_id)
values(21,7);


insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(22,'Back to the Future Part III', 1,118,'1990-05-25','Volver al futuro III');
insert into actor_pelicula (pelicula_id, actor_id)
values(22, 9);
insert into actor_pelicula (pelicula_id, actor_id)
values(22, 10);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(22, 1);
insert into genero_pelicula(pelicula_id, genero_id)
values(22,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(22,4);
insert into genero_pelicula(pelicula_id, genero_id)
values(22,3);
insert into genero_pelicula(pelicula_id, genero_id)
values(22,7);


insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(23,'Raiders of the Lost Ark', 6,115,'1981-06-12','Indiana Jones y Los cazadores del arca perdida');
insert into actor_pelicula(pelicula_id, actor_id)
values(23, 5);
insert into actor_pelicula(pelicula_id, actor_id)
values(23, 43);
insert into genero_pelicula(pelicula_id, genero_id)
values(23,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(23,7);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(23, 1);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(23, 9);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(23, 5);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(23, 3);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(23, 11);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(23, 10);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(23, 12);

insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(24,'Indiana Jones and the Temple of Doom', 6,118,'1984-05-23','Indiana Jones y El Templo Maldito');
insert into actor_pelicula(pelicula_id, actor_id)
values(24, 5);
insert into actor_pelicula(pelicula_id, actor_id)
values(24, 44);
insert into genero_pelicula(pelicula_id, genero_id)
values(24,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(24,7);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(24, 1);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(24, 7);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(24, 8);

insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(25,'Indiana Jones and the Kingdom of the Crystal Skull', 6,140,'2008-05-18','Indiana Jones y El reino de la calavera de cristal');
insert into actor_pelicula(pelicula_id, actor_id)
values(25, 5);
insert into actor_pelicula(pelicula_id, actor_id)
values(25, 45);
insert into genero_pelicula(pelicula_id, genero_id)
values(25,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(25,7);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(25, 1);

insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(26,'Jumanji: Welcome to the Jungle',14,119,'2017-12-05','Jumanji: Bienvenidos a la Jungla');
insert into actor_pelicula(pelicula_id, actor_id)
values(26, 39);
insert into actor_pelicula(pelicula_id, actor_id)
values(26, 40);
insert into actor_pelicula(pelicula_id, actor_id)
values(26, 41);
insert into actor_pelicula(pelicula_id, actor_id)
values(26, 42);
insert into genero_pelicula(pelicula_id, genero_id)
values(26,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(26,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(26,4);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(26, 1);
insert into pelicula(id, titulo, director_id, duracion, fecha_estreno, titulo_espaniol)
values(27,'Jumanji: The Next Level', 14,122,'2019-12-04','Jumanji: El Siguiente Nivel');
insert into actor_pelicula(pelicula_id, actor_id)
values(27, 39);
insert into actor_pelicula(pelicula_id, actor_id)
values(27, 40);
insert into actor_pelicula(pelicula_id, actor_id)
values(27, 41);
insert into actor_pelicula(pelicula_id, actor_id)
values(27, 42);
insert into genero_pelicula(pelicula_id, genero_id)
values(27,6);
insert into genero_pelicula(pelicula_id, genero_id)
values(27,1);
insert into genero_pelicula(pelicula_id, genero_id)
values(27,4);
insert into idioma_original_pelicula(pelicula_id, idioma_original_id)
values(27, 1);

select * from genero;
select * from idioma_original;
select * from idioma_original_pelicula;
select * from director;
select * from pelicula;
select * from genero;
select * from premio;
select * from pelicula_premio;
select * from genero_pelicula;
select * from actor_pelicula;
select * from actor;
delete from actor where actor.id = 0;

insert into premio (id, nombre)
values(1,'Oscar');
insert into premio (id, nombre)
values(2,'BAFTA');
insert into premio (id, nombre)
values(3,'Globos de Oro');
insert into premio (id, nombre)
values(4,'Annie');


insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(1,1,7);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(1,2,2);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(1,3,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(2,1,11);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(2,2,0);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(2,3,4);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(3,1,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(3,2,0);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(3,4,2);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(4,1,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(4,2,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(4,3,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(4,4,10);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(5,1,5);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(5,2,3);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(5,3,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(6,1,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(6,2,0);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(6,3,0);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(7,1,6);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(7,2,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(7,3,3);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(8,1,3);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(8,2,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(8,3,0);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(9,1,1);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(9,2,0);
insert into pelicula_premio (pelicula_id, premio_id,cantidad_ganados)
values(9,3,0);

-- sagas 

insert into saga(id, nombre)
values(1,'Star Wars');
insert into saga(id, nombre)
values(2,'Back to the Future');
insert into saga(id, nombre)
values(3,'Indiana Jones');
insert into saga(id, nombre)
values(4,'Jumanji');

insert into saga_pelicula(pelicula_id,saga_id,orden)
values(1,1,6);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(6,2,1);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(9,3,3);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(10,4,1);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(11,1,7);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(12,1,8);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(13,1,1);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(14,1,2);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(15,1,3);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(16,1,9);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(17,1,5);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(18,1,10);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(19,1,4);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(20,1,11);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(21,2,2);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(22,2,3);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(23,3,1);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(24,3,2);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(25,3,4);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(26,4,2);
insert into saga_pelicula(pelicula_id,saga_id,orden)
values(27,4,3);



-- pelicula con sus actores
select pelicula.titulo, group_concat(distinct actor.nombre separator ', ') as actores, 
group_concat(distinct genero.nombre separator ',') as generos, group_concat(distinct idioma_original.idioma separator ', ') as idiomas,
director.nombre as director, pelicula.duracion, pelicula.titulo_espaniol, pelicula.fecha_estreno
from pelicula
left join actor_pelicula on pelicula.id = actor_pelicula.pelicula_id
left join actor on actor_pelicula.actor_id = actor.id
left join director on pelicula.director_id = director.id
left join genero_pelicula on pelicula.id = genero_pelicula.pelicula_id
left join genero on genero_pelicula.genero_id = genero.id
left join idioma_original_pelicula on pelicula.id = idioma_original_pelicula.pelicula_id
left join idioma_original on idioma_original_pelicula.idioma_original_id = idioma_original.id
group by pelicula.id, pelicula.titulo;

-- 1
select pelicula.titulo, director.nombre from pelicula
join director on pelicula.director_id = director.id
join saga_pelicula on saga_pelicula.pelicula_id = pelicula.id
join saga on saga_pelicula.saga_id = saga.id
order by saga_pelicula.saga_id ,saga_pelicula.orden asc;

-- 2 director es actor
SELECT pelicula.titulo , director.nombre,group_concat(distinct actor.nombre separator ', ') as actores FROM pelicula 
JOIN director ON pelicula.director_id = director.id
join actor_pelicula on pelicula.id = actor_pelicula.pelicula_id
join actor on actor_pelicula.actor_id = actor.id
where actor.nombre = director.nombre;

-- 3 Los nombres de todas las películas, junto con la cantidad de actores que actúan en cada una,
-- ordenadas por cantidad de actores en forma descendiente.
select pelicula.titulo, count(actor.id) as numero_actores from pelicula
left join actor_pelicula on pelicula.id = actor_pelicula.pelicula_id
left join actor on actor_pelicula.actor_id = actor.id
group by pelicula.id, pelicula.titulo
order by numero_actores desc;

-- 4
select pelicula.titulo from pelicula
left join actor_pelicula on pelicula.id = actor_pelicula.pelicula_id
left join actor on actor_pelicula.actor_id = actor.id
where actor.id is null;

-- 5 
select actor.nombre from actor
join actor_pelicula on actor_pelicula.actor_id = actor.id
group by actor.nombre, actor_pelicula.actor_id
having count(actor_pelicula.actor_id) > 1;

-- 6
select avg(duracion) as promedio_duracion from pelicula
where fecha_estreno < '2000-01-01';

-- 7
select pelicula.titulo from pelicula
join pelicula_premio on pelicula.id = pelicula_premio.pelicula_id
join premio on pelicula_premio.premio_id = premio.id 
join idioma_original_pelicula on pelicula.id = idioma_original_pelicula.pelicula_id
join idioma_original on idioma_original_pelicula.idioma_original_id = idioma_original.id
where idioma_original.id <> 1 and premio.nombre = 'Oscar'
group by pelicula.id, pelicula.titulo;

-- 8
select actor.nombre from actor
join actor_pelicula on actor_pelicula.actor_id = actor.id;


-- 9
select pelicula.titulo, pelicula.duracion from pelicula
where pelicula.titulo = pelicula.titulo_espaniol;

-- 10
select genero.nombre as genero, count(pelicula.id) as numero_peliculas from genero
left join genero_pelicula on genero.id = genero_pelicula.genero_id
left join pelicula on genero_pelicula.pelicula_id = pelicula.id
group by genero.nombre;






 

-- descs
-- desc pelicula;
-- desc director;
-- desc genero;
-- desc genero_pelicula;
-- desc pelicula_premio;
-- desc pelicula_actor;
-- desc premio;

-- drop table director;
-- drop table premio;
-- drop table genero;
-- drop table actor;
-- drop table pelicula;
-- drop table actor_pelicula;
-- drop table pelicula_premio;
-- drop table saga;
-- drop table saga_pelicula;
-- drop table genero_pelicula;
-- drop table idioma_original;
delete from actor_pelicula where pelicula_id = 15 and actor_id = 30;
select * from actor_pelicula;
-- alter table pelicula drop constraint fk_pelicula_director;

