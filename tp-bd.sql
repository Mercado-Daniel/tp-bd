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
nombre varchar(100),
categoria varchar(100));
-- pelicula_premio
create table pelicula_premio(
pelicula_id int, 
premio_id int,
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

select * from idioma_original;
select * from idioma_original_pelicula;
select * from director;
select * from pelicula;
select * from genero;
select * from genero_pelicula;
select * from actor_pelicula;
select * from actor;
delete from pelicula where pelicula.id = 0;


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

-- 9
select pelicula.titulo, pelicula.duracion from pelicula
where pelicula.titulo = pelicula.titulo_espaniol;

-- 10
select genero.nombre as genero, count(pelicula.id) as numero_peliculas from genero
left join genero_pelicula on genero.id = genero_pelicula.genero_id
left join pelicula on genero_pelicula.pelicula_id = pelicula.id
group by genero.id, genero.nombre
order by numero_peliculas desc;






 

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

-- alter table pelicula drop constraint fk_pelicula_director;

