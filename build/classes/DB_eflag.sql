DROP DATABASE IF EXISTS eflag;
CREATE DATABASE eflag;
USE eflag;
CREATE TABLE usuarios(
 id_usuario INT(6) PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(50) NOT NULL, 
 password VARCHAR(50) NOT NULL, 
 email VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE peliculas(
id_pelicula INT(10) PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(50) NOT NULL,
directores VARCHAR(200) NOT NULL,
actores VARCHAR(500) NOT NULL,
duracion INT(3) NOT NULL,
fecha_estreno CHAR(10) NOT NULL,
nota_media NUMERIC(5,3),
votos INT(3),
caratula VARCHAR(200) NOT NULL,
trailer VARCHAR(200) NOT NULL, 
generos VARCHAR(200) NOT NULL
);
CREATE TABLE favoritas(
 id_pelicula INT(10),
 id_usuario INT(6),
 CONSTRAINT PK_FAVORITAS PRIMARY KEY (id_pelicula, id_usuario),
 CONSTRAINT FK_FAVORITAS_P FOREIGN KEY (id_pelicula) REFERENCES peliculas (id_pelicula) ON DELETE CASCADE,
 CONSTRAINT FK_FAVORITAS_U FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)ON DELETE CASCADE
 );
 
 INSERT INTO usuarios VALUES(null, "arian", "arian", "a@mail");
 INSERT INTO usuarios VALUES(null, "fran", "fran", "f@mail");
 INSERT INTO peliculas VALUES(null, "arito", "bebe", "tu@mail", 120,"2017-05-19",null, null,"url", "url", "comedia");
 INSERT INTO favoritas VALUES(1, 1);
 
 