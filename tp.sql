use tp_base_de_datos;
-- Tabla pelicula
create table pelicula(
id int auto_increment primary key,
titulo varchar(100) not null,
director_id int,
duracion integer not null,
idioma_original varchar(100) not null,
fecha_estreno date not null,
titulo_espaniol varchar(100) not null);

-- tabla actor
create table actor(
id int auto_increment primary key,
nombre varchar(100) not null);

-- tabla actor_pelicula
create table actor_pelicula(
pelicula_id int,
actor_id int,
foreign key (pelicula_id) references pelicula(id),
foreign key (actor_id) references actor(id),
primary key (pelicula_id, actor_id));

-- tabla director
create table director (
id int auto_increment primary key,
nombre varchar(100) not null);

-- asigno fk de director a pelicula.director_id
alter table pelicula
add constraint fk_pelicula_director
foreign key (director_id)
references director (id);

-- tabla genero
create table genero (
id int auto_increment primary key,
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
id int auto_increment primary key,
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
foreign key (pelicula_id) references pelicula(id),
foreign key (saga_id) references saga(id),
primary key (pelicula_id, saga_id)); -- asigno la combinacion de claves foraneas para obtener la clave primaria

-- cargo generos
insert into genero (nombre)
values ('fantasia');

insert into genero (nombre)
values ('animacion');

insert into genero (nombre)
values ('ciencia ficcion');

insert into genero (nombre)
values ('comedia');

insert into genero (nombre)
values ('drama');

insert into genero (nombre)
values ('aventura');

insert into genero (nombre)
values ('accion');

insert into genero (nombre)
values ('historica');

insert into genero (nombre)
values ('romance');

select * from genero;

-- cargo directores
insert into director (nombre)
values ('Robert Zemeckis');

insert into director (nombre)
values ('George Lucas');

insert into director (nombre)
values ('Hayao Miyazaki');

insert into director (nombre)
values ('Pete Docter');

insert into director (nombre)
values ('Mel Gibson');

insert into director (nombre)
values ('Steven Spielberg');

insert into director (nombre)
values ('Joe Johnston');

insert into director(nombre)
values ('James Cameron');

select * from director;

-- cargo actores
insert into actor (nombre)
values ('Leonardo DiCaprio');

insert into actor (nombre)
values ('Kate Winslet');

insert into actor (nombre)
values ('Mark Hamill');

insert into actor (nombre)
values ('Carrie Fisher');

insert into actor (nombre)
values ('Harrison Ford');

insert into actor (nombre)
values ('Mel Gibson');

insert into actor (nombre)
values ('Sophie Marceau');

insert into actor (nombre)
values ('Patrick McGoohan');

insert into actor (nombre)
values ('Michael J. Fox');

insert into actor (nombre)
values ('Cristofer Lloyd');

insert into actor (nombre)
values ('Lea Thompson');

insert into actor (nombre)
values ('Crispin Glover');

insert into actor (nombre)
values ('Tom Hanks');

insert into actor (nombre)
values ('Robin Wright');

insert into actor (nombre)
values ('Gary Sinise');

insert into actor (nombre)
values ('Bob Hoskins');

insert into actor (nombre)
values ('Sean Connery');

insert into actor (nombre)
values ('Robin Williams');

insert into actor (nombre)
values ('Kirsten Dunst');

insert into actor (nombre)
values ('Bradley Pierce');

insert into actor (nombre)
values ('Bonnie Hunt');

select * from actor;

-- cargo peliculas
insert into pelicula(titulo, director_id, duracion, idioma_original, fecha_estreno, titulo_espaniol)
values('Star Wars: Episode IV – A New Hope', 2, 121, 'Ingles', '1977-05-25','Star Wars: Episodio IV
- Una nueva esperanza');
-- asigno actores a la pelicula
-- star wars 4
insert into actor_pelicula (pelicula_id, actor_id)
values(1, 3);
insert into actor_pelicula (pelicula_id, actor_id)
values(1, 4);
insert into actor_pelicula (pelicula_id, actor_id)
values(1, 5);

-- nombre de los actores de la pelicula
select actor.nombre
from actor
inner join actor_pelicula on actor.id = actor_pelicula.actor_id
inner join pelicula on actor_pelicula.pelicula_id = pelicula.id
where pelicula.titulo = 'Star Wars: Episode IV – A New Hope';

-- titanic
insert into pelicula(titulo, director_id, duracion, idioma_original, fecha_estreno, titulo_espaniol)
values('Titanic', 8, 194, 'Ingles', '1997-12-18','Titanic');

-- cargo los actores
insert into actor_pelicula(pelicula_id, actor_id)
values(2, 1);
insert into actor_pelicula(pelicula_id, actor_id)
values(2,2);

-- Sen to Chihiro no Kamikakushi, el viaje de chihiro
insert into pelicula(titulo, director_id, duracion, idoma_original;

-- pelicula con sus actores
select pelicula.titulo, group_concat(actor.nombre separator ',') as actores
from pelicula
left join actor_pelicula on pelicula.id = actor_pelicula.pelicula_id
left join actor on actor_pelicula.actor_id = actor.id
group by pelicula.id, pelicula.titulo;


-- descs
desc pelicula;
desc director;
desc genero;
desc genero_pelicula;
desc pelicula_premio;
desc pelicula_actor;
desc premio;

drop table director;
drop table premio;
drop table genero;
drop table actor;
drop table pelicula;
drop table pelicula_actor;
drop table pelicula_premio;
drop table saga;
drop table saga_pelicula;
drop table genero_pelicula;

alter table pelicula drop constraint fk_pelicula_director;
