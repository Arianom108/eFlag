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
generos VARCHAR(200) NOT NULL,
sinopsis VARCHAR (2000) NOT NULL
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
 INSERT INTO favoritas VALUES(1, 1);
 INSERT INTO peliculas VALUES(null, "Vengadores: La era de Ultr�n", "Joss Whedon", "Robert Downey Jr.,  Chris Evans,  Chris Hemsworth,  Scarlett Johansson, Jeremy Renner,  Mark Ruffalo,  James Spader,  Elizabeth Olsen, Aaron Taylor-Johnson,  Paul Bettany,  Samuel L. Jackson,  Cobie Smulders, Linda Cardellini,  Claudia Kim,  Don Cheadle,  Andy Serkis,  Thomas Kretschmann, Stellan Skarsg�rd,  Anthony Mackie,  Julie Delpy,  Idris Elba,  Hayley Atwell,  Stan Lee", 141,"2015-5-1",null, null,"http://www.imdb.com/title/tt2395427/mediaviewer/rm4050576640", "https://youtu.be/JQWGle-bKmE", "Fant�stico. Acci�n. Ciencia ficci�n. Aventuras | Superh�roes. C�mic. Marvel Comics. Secuela. 3-D", "Cuando Tony Stark intenta reactivar un programa ca�do en desuso cuyo objetivo es mantener la paz, las cosas empiezan a torcerse y los h�roes m�s poderosos de la Tierra, incluyendo a Iron Man, Capit�n Am�rica, Thor, El Incre�ble Hulk, Viuda Negra y Ojo de Halc�n, tendr�n que afrontar la prueba definitiva cuando el destino del planeta se ponga en juego. Cuando el villano Ultr�n emerge, le corresponder� a Los Vengadores detener sus terribles planes, que junto a inc�modas alianzas llevar�n a una inesperada acci�n que allanar� el camino para una �pica y �nica aventura. ");
 
 
 INSERT INTO peliculas VALUES(null, "Star Wars. Episode VII: The Force Awakens", "J.J. Abrams", "Daisy Ridley,  John Boyega,  Harrison Ford,  Adam Driver,  Oscar Isaac, Carrie Fisher,  Peter Mayhew,  Domhnall Gleeson,  Max von Sydow, Gwendoline Christie,  Lupita Nyong'o,  Andy Serkis,  Anthony Daniels,  Mark Hamill, Greg Grunberg,  Kenny Baker,  Simon Pegg,  Christina Chong,  Miltos Yerolemou, Thomas Brodie-Sangster,  Ken Leung,  Harriet Walter,  Iko Uwais,  Yayan Ruhian, Warwick Davis,  Jessica Henwick,  Daniel Craig,  Billie Lourd,  Judah Friedlander, Kevin Smith", 135,"2015-05-19",null, null,"
https://images-na.ssl-images-amazon.com/images/M/MV5BOTE5NzYyNjM0Ml5BMl5BanBnXkFtZTgwNjk4MDIwMjI@._V1_UX182_CR0,0,182,268_AL_.jpg", "https://youtu.be/FHbnQ5DUUF4", "Ciencia Ficci�n", "Treinta a�os despu�s de la victoria de la Alianza Rebelde sobre la segunda Estrella de la Muerte (hechos narrados en el Episodio VI: El retorno del Jedi), la galaxia est� todav�a en guerra. Una nueva Rep�blica se ha constituido, pero una siniestra organizaci�n, la Primera Orden, ha resurgido de las cenizas del Imperio Gal�ctico. A los h�roes de anta�o, que luchan ahora en la Resistencia, se suman nuevos h�roes: Poe Dameron, un piloto de caza, Finn, un desertor de la Primera Orden, Rey, una joven chatarrera, y BB-8, un androide rodante. Todos ellos luchan contra las fuerzas del Mal: el Capit�n Phasma, de la Primera Orden, y Kylo Ren, un temible y misterioso personaje que empu�a un sable de luz roja.");	
 
 INSERT INTO peliculas VALUES(null, "The Pianist (Le Pianiste)", "Roman Polanski", "Adrien Brody,  Thomas Kretschmann,  Maureen Lipman,  Ed Stoppard,  Emilia Fox, Frank Finlay,  Julia Rayner,  Jessica Kate Meyer", 148,"2002-??-??",null, null,"https://images-na.ssl-images-amazon.com/images/M/MV5BOWRiZDIxZjktMTA1NC00MDQ2LWEzMjUtMTliZmY3NjQ3ODJiXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY268_CR6,0,182,268_AL_.jpg", "https://youtu.be/itR0-I9idXk", "Drama", "Wladyslaw Szpilman, un brillante pianista polaco de origen jud�o, vive con su familia en el ghetto de Varsovia. Cuando, en 1939, los alemanes invaden Polonia, consigue evitar la deportaci�n gracias a la ayuda de algunos amigos. Pero tendr� que vivir escondido y completamente aislado durante mucho tiempo, y para sobrevivir tendr� que afrontar constantes peligros.");
 
 INSERT INTO peliculas VALUES(null, "Manolito Gafotas", "Miguel Albaladejo", "David S�nchez del Rey,  Adriana Ozores,  Roberto �lvarez,  Antonio Gamero, Fedra Lorente,  Marta Fern�ndez-Muro,  Gloria Mu�oz,  Alejandro Mart�nez, David Mart�nez,  Laura Calabuig,  Sergio del Pino,  �lvaro Miranda, Belinda Washington,  Antonia San Juan", 86,"1999-05-19",null, null,"https://images-na.ssl-images-amazon.com/images/M/MV5BMTIwMjU4NjA0MF5BMl5BanBnXkFtZTcwNDQ0NDMzMQ@@._V1_UY268_CR0,0,182,268_AL_.jpg", "https://youtu.be/pH7NocxK324", "Comedia", "El verano se presenta francamente mal para Manolito Gafotas. Est� condenado, un a�o m�s, a pasar las vacaciones en su peque�o piso de Carabanchel Alto, con su madre, su abuelo y su hermano peque�o. Y encima, para disgusto de su madre, ha suspendido las matem�ticas. Manolito espera la llegada de su padre, camionero de profesi�n, con la ilusi�n de que los lleve a la playa");
 
 INSERT INTO peliculas VALUES(null, "Jack", "Francis Ford Coppola", "Robin Williams,  Diane Lane,  Jennifer Lopez,  Brian Kerwin,  Fran Drescher, Bill Cosby,  Michael McKean,  Todd Bosley", 113,"1996-05-19",null, null,"http://1.bp.blogspot.com/_iQzYKNHy3yY/TF1cJUqcTNI/AAAAAAAAAO4/kypQT7VEDpQ/s275/jack.jpg", "https://youtu.be/iHaFdSx26WM", "comedia", "Jack es un ni�o atrapado en un cuerpo de adulto: sufre una extra�a enfermedad que hace que su crecimiento f�sico se cuadriplique mientras que su cerebro, que se desarrolla con normalidad, es el de un ni�o de diez a�os. No es f�cil adaptarse a una vida que va a ser muy corta y esto se refleja en las relaciones con su familia y con los amigos del colegio");
 
 INSERT INTO peliculas VALUES(null, " El bueno, el feo y el malo ", "Sergio Leone", "Al Mulock, Aldo Giuffr�, Aldo Sambrell, Claudio Scarchilli, Clint Eastwood, Eli Wallach, Enzo Petito, Lee Van Cleef, Luigi Pistilli, Mario Brega, Rada Rassimov", 161,"1966-05-19",null, null,"http://image.tmdb.org/t/p/w396/ptv3EAx4Qet0G4ZdxzfKtVFwZAp.jpg", "https://youtu.be/exJOy6uTkek", "western, Drama", "Durante la guerra civil norteamericana tres cazadores de recompensas buscan un tesoro que ninguno de ellos puede encontrar sin la ayuda de los otros dos. As� que los tres colaboran entre s� para conseguir su bot�n, al menos en apariencia.");
 
 INSERT INTO peliculas VALUES(null, "El club de la lucha", "David Fincher", "Edward Norton,  Brad Pitt,  Helena Bonham Carter,  Meat Loaf,  Jared Leto, Van Quattro,  Markus Redmond,  Michael Girardin,  Rachel Singer,  Eion Bailey, David Lee Smith", 139,"1999-05-19",null, null,"https://images-na.ssl-images-amazon.com/images/M/MV5BZGY5Y2RjMmItNDg5Yy00NjUwLThjMTEtNDc2OGUzNTBiYmM1XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg", "https://youtu.be/I8892yne-ms", "Drama", "Un joven hastiado de su gris y mon�tona vida lucha contra el insomnio. En un viaje en avi�n conoce a un carism�tico vendedor de jab�n que sostiene una teor�a muy particular: el perfeccionismo es cosa de gentes d�biles; s�lo la autodestrucci�n hace que la vida merezca la pena. Ambos deciden entonces fundar un club secreto de lucha, donde poder descargar sus frustaciones y su ira, que tendr� un �xito arrollador."); 
 
 INSERT INTO peliculas VALUES(null, "La vida es bella", "Roberto Benigni", "Roberto Benigni,  Nicoletta Braschi,  Giorgio Cantarini,  Marisa Paredes, Giustino Durano,  Horst Buchholz,  Sergio Bini Bustric", 117,"1997-05-19",null, null,"https://images-na.ssl-images-amazon.com/images/M/MV5BYmJmM2Q4NmMtYThmNC00ZjRlLWEyZmItZTIwOTBlZDQ3NTQ1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg", "https://youtu.be/z_bgAw5KLK4", "comedia", "En 1939, a punto de estallar la Segunda Guerra Mundial (1939-1945), el extravagante Guido llega a Arezzo (Toscana) con la intenci�n de abrir una librer�a. All� conoce a Dora y, a pesar de que es la prometida del fascista Rodolfo, se casa con ella y tiene un hijo. Al estallar la guerra, los tres son internados en un campo de exterminio, donde Guido har� lo imposible para hacer creer a su hijo que la terrible situaci�n que est�n padeciendo es tan s�lo un juego.");
 
 INSERT INTO peliculas VALUES(null, "El padrino", "Francis Ford Coppola", "Marlon Brando,  Al Pacino,  James Caan,  Robert Duvall,  Diane Keaton,  John Cazale, Talia Shire,  Richard Castellano,  Sterling Hayden,  Gianni Russo,  Rudy Bond, John Marley,  Richard Conte,  Al Lettieri,  Abe Vigoda,  Franco Citti,  Lenny Montana, Al Martino,  Joe Spinell,  Simonetta Stefanelli,  Morgana King,  Alex Rocco, John Martino,  Salvatore Corsitto", 175,"1972-05-19",null, null,"
https://images-na.ssl-images-amazon.com/images/M/MV5BMTQyNTE4NzMzNF5BMl5BanBnXkFtZTgwMDgzNTY3MDE@._V1_UY268_CR3,0,182,268_AL_.jpg ", "https://youtu.be/1aV9X2d-f5g", "Accion", "Am�rica, a�os 40. Don Vito Corleone (Marlon Brando) es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York. Tiene cuatro hijos: Connie (Talia Shire), el impulsivo Sonny (James Caan), el pusil�nime Fredo (John Cazale) y Michael (Al Pacino), que no quiere saber nada de los negocios de su padre. Cuando Corleone, en contra de los consejos de 'Il consigliere' Tom Hagen (Robert Duvall), se niega a participar en el negocio de las drogas, el jefe de otra banda ordena su asesinato. Empieza entonces una violenta y cruenta guerra entre las familias mafiosas");
 
 
 INSERT INTO peliculas VALUES(null, "Hachiko", "Lasse Hallstr�m", "Richard Gere,  Joan Allen,  Sarah Roemer,  Jason Alexander,  Cary-Hiroyuki Tagawa, Erick Avari,  Davenia McFadden,  Robert Capron,  Kevin DeCoste,  Bates Wilder, Robbie Sublett,  Rob Degnan,  Tora Hallstrom", 93,"2009-05-19",null, null,"https://images-na.ssl-images-amazon.com/images/M/MV5BYTNhZDFkN2ItMmZjNy00ODUwLTk1Y2MtMDZhYTA2N2MyNDU5XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR3,0,182,268_AL_.jpg", "https://youtu.be/swp2_g0JbwY", "Drama", "Parker Wilson, un profesor universitario que da clases de m�sica, recoge un d�a a un perro de origen japon�s y raza Akita, al que encuentra abandonado en una estaci�n. Como nadie lo reclama, se lo lleva a su casa. Parker va descubriendo entonces los entra�ables lazos que pueden unir a una persona y a un animal. Remake de la pel�cula japonesa 'Hachiko monogatari' (1987) dirigida por Seijir� K�yama y basada en la historia real de un perro tan fiel a su due�o que iba todos los d�as a esperarlo a la estaci�n. Actualmente, en esa estaci�n, existe una estatua de bronce erigida en su honor. ");
 
 INSERT INTO peliculas VALUES(null, "Enemigo p�blico", "Tony Scott", "Will Smith,  Gene Hackman,  Jon Voight,  Lisa Bonet,  Jason Lee,  Ian Hart, Tom Sizemore,  Regina King,  Loren Dean,  Jake Busey,  Barry Pepper, Gabriel Byrne,  Stuart Wilson,  Jason Robards,  Philip Baker Hall,  Laura Cayouette, Seth Green,  Scott Caan,  Jack Black,  Jamie Kennedy,  Grant Heslov,  Ivana Milicevic", 132,"1998-05-19",null, null,"http://www.imdb.com/title/tt0120660/mediaviewer/rm4240902912", "https://youtu.be/R90vWtcHLlE", "Accion", "La feliz vida familiar y la brillante carrera del abogado Robert Clayton Dean est�n a punto de desmoronarse, cuando llega a sus manos una cinta de v�deo que contiene im�genes del asesinato de un miembro del Congreso de los Estados Unidos, en el que aparecen involucrados agentes del Gobierno.");
 
 INSERT INTO peliculas VALUES(null, "Interstellar", "Christopher Nolan", "Matthew McConaughey,  Anne Hathaway,  David Gyasi,  Jessica Chastain, Mackenzie Foy,  Matt Damon,  Michael Caine,  John Lithgow,  Casey Affleck, Timoth�e Chalamet,  Wes Bentley,  Ellen Burstyn,  Topher Grace,  David Oyelowo, Collette Wolfe,  Leah Cairns,  Elyes Gabel", 169,"2014-05-19",null, null,"http://www.imdb.com/title/tt0816692/mediaviewer/rm1874904064", "https://youtu.be/UoSSbmD9vqc", "Ciencia ficci�n", "Al ver que la vida en la Tierra est� llegando a su fin, un grupo de exploradores dirigidos por el piloto Cooper (McConaughey) y la cient�fica Amelia (Hathaway) emprenden una misi�n que puede ser la m�s importante de la historia de la humanidad: viajan m�s all� de nuestra galaxia para descubrir otra que pueda garantizar el futuro de la raza humana.");

 INSERT INTO peliculas VALUES(null, "Shrek", "Andrew Adamson,  Vicky Jenson", "Animation", 87,"2001-05-19",null, null,"http://www.imdb.com/title/tt0126029/mediaviewer/rm955136512", "https://youtu.be/jxqQPrUomTc", "comedia", "Hace mucho tiempo, en una lejan�sima ci�naga, viv�a un feroz ogro llamado Shrek. De repente, un d�a, su soledad se ve interrumpida por una invasi�n de sorprendentes personajes. Hay ratoncitos ciegos en su comida, un enorme y mal�simo lobo en su cama, tres cerditos sin hogar y otros seres que han sido deportados de su tierra por el malvado Lord Farquaad. Para salvar su territorio, Shrek hace un pacto con Farquaad y emprende viaje para conseguir que la bella princesa Fiona acceda a ser la novia del Lord. En tan importante misi�n le acompa�a un divertido burro, dispuesto a hacer cualquier cosa por Shrek: todo, menos guardar silencio");
 
 INSERT INTO peliculas VALUES(null, "Titanic", "James Cameron", "Leonardo DiCaprio,  Kate Winslet,  Billy Zane,  Kathy Bates,  Frances Fisher, Gloria Stuart,  Bill Paxton,  Bernard Hill,  David Warner,  Victor Garber, Jonathan Hyde,  Suzy Amis,  Danny Nucci,  Jason Barry,  Ewan Stewart, Ioan Gruffudd", 195,"1997-05-19",null, null,"http://www.imdb.com/title/tt0120338/mediaviewer/rm2647458304", "https://youtu.be/FiRVcExwBVA", "comedia","Jack (DiCaprio), un joven artista, gana en una partida de cartas un pasaje para viajar a Am�rica en el Titanic, el transatl�ntico m�s grande y seguro jam�s construido. A bordo conoce a Rose (Kate Winslet), una joven de una buena familia venida a menos que va a contraer un matrimonio de conveniencia con Cal (Billy Zane), un millonario engre�do a quien s�lo interesa el prestigioso apellido de su prometida. Jack y Rose se enamoran, pero el prometido y la madre de ella ponen todo tipo de trabas a su relaci�n. Mientras, el gigantesco y lujoso transatl�ntico se aproxima hacia un inmenso iceberg.");
 
 INSERT INTO peliculas VALUES(null, "Resident Evil", "Paul W.S. Anderson", "Milla Jovovich,  Michelle Rodriguez,  Eric Mabius,  James Purefoy,  Pasquale Aleardi, Stephen Billington,  Anna Bolt,  Colin Salmon,  Marisol Nichols,  Heike Makatsch, Joseph May", 96,"2002-05-19",null, null,"http://www.imdb.com/title/tt0120804/mediaviewer/rm618729728", "https://youtu.be/cMRt9hHkljA", "Terror", "En un centro clandestino de investigaci�n gen�tica -con fines militares- de una poderosa multinacional se produce un brote v�rico que contamina todo el edificio. Para contener la fuga el ordenador que controla el centro sella toda la instalaci�n y, en un principio se cree que mueren todos los empleados, pero en realidad se han convertido en feroces zombis.");
 
 INSERT INTO peliculas VALUES(null, "Gladiator", "Ridley Scott", "Russell Crowe,  Joaquin Phoenix,  Connie Nielsen,  Oliver Reed,  Richard Harris, Ralf Moeller,  Derek Jacobi,  Djimon Hounsou,  David Schofield,  John Shrapnel, Spencer Treat Clark,  Tomas Arana,  David Hemmings,  Tommy Flanagan, Sven-Ole Thorsen,  Tony Curran,  Giorgio Cantarini,  Omid Djalili,  Giannina Facio, Michael Sheen", 150,"2000-05-19",null, null,"http://www.imdb.com/title/tt0172495/mediaviewer/rm2442542592", "https://youtu.be/ol67qo3WhJk", "Accion", "En el a�o 180, el Imperio Romano domina todo el mundo conocido. Tras una gran victoria sobre los b�rbaros del norte, el anciano emperador Marco Aurelio (Richard Harris) decide transferir el poder a M�ximo (Russell Crowe), bravo general de sus ej�rcitos y hombre de inquebrantable lealtad al imperio. Pero su hijo C�modo (Joaquin Phoenix), que aspiraba al trono, no lo acepta y trata de asesinar a M�ximo");
 
 INSERT INTO peliculas VALUES(null, "Steve Jobs", "Danny Boyle", "Michael Fassbender,  Kate Winslet,  Seth Rogen,  Jeff Daniels,  Michael Stuhlbarg, Katherine Waterston,  Sarah Snook,  Perla Haney-Jardine,  Adam Shapiro, Jackie Dallas,  Makenzie Moss,  Afsheen Olyaie,  Tina Gilton,  Tom O'Reilly, Natalie Stephany Aguilar", 121,"2015-05-19",null, null,"http://www.imdb.com/title/tt2080374/mediaviewer/rm2977623552", "https://youtu.be/CPSJaP5m_3w", "Drama" , "Biopic del m�tico empresario y programador inform�tico Steve Jobs (1955-2011), centrado en la �poca en la que lanz� los tres productos ic�nicos de Apple");
 
 INSERT INTO peliculas VALUES(null, "Charlie y la fabrica de chocolate", "Tim Burton", "Johnny Depp,  Freddie Highmore,  David Kelly,  Deep Roy,  Helena Bonham Carter, Noah Taylor,  James Fox,  Julia Winter,  Missi Pyle,  AnnaSophia Robb, Adam Godley,  Jordan Fry,  Christopher Lee,  Franziska Troegner,  Philip Wiegratz, Eileen Essell,  Liz Smith,  David Morris,  Nitin Ganatra", 116,"2005-05-19",null, null,"http://www.imdb.com/title/tt0367594/mediaviewer/rm1861258496", "https://youtu.be/BGem82vCZNM", "Fantastico", "Charlie Bucket (Freddie Highmore), un ni�o muy bueno de una familia muy pobre, gana un concurso para disfrutar de una visita de un d�a a la gigantesca f�brica de chocolate del exc�ntrico Willy Wonka (Johnny Depp) y su equipo de Oompa-Loompas. Cuatro ni�os m�s de diferentes partes del mundo lo acompa�an a trav�s de un mundo fant�stico y m�gico lleno de diferentes sabores");
 INSERT INTO peliculas VALUES(null, "Terminator 2", "James Cameron", "Arnold Schwarzenegger,  Linda Hamilton,  Edward Furlong,  Robert Patrick, Earl Boen,  Joe Morton,  S. Epatha Merkerson,  Michael Biehn,  Danny Cooksey, Castulo Guerra,  Jenette Goldstein,  Xander Berkeley,  Michael Edwards, Dean Norris", 135,"1991-05-19",null, null,"http://www.imdb.com/title/tt0103064/mediaviewer/rm1982141440", "https://youtu.be/UJ4JNMdrhKI", "Accion", "Sarah Connor, la madre soltera del rebelde John Connor, est� ingresada en un psiqui�trico. Algunos a�os antes, un viajero del tiempo le hab�a revelado que su hijo ser�a el salvador de la humanidad en un futuro dominado por las m�quinas. Se convirti� entonces en una especie de guerrera y educ� a su hijo John en t�cticas de supervivencia. Esta es la raz�n por la que est� recluida en un manicomio. Cuando un nuevo androide mejorado, un T-1000, llega del futuro para asesinar a John, un viejo modelo T-800 ser� enviado para protegerle.");
  
 INSERT INTO peliculas VALUES(null, "La milla verde", "Frank Darabont", "Tom Hanks,  Michael Clarke Duncan,  David Morse,  Doug Hutchison,  Sam Rockwell, Barry Pepper,  Jeffrey DeMunn,  Michael Jeter,  Bonnie Hunt,  James Cromwell, Gary Sinise,  Patricia Clarkson,  Graham Greene,  Harry Dean Stanton, William Sadler,  Paula Malcomson,  Dabbs Greer,  Brian Libby,  Bailey Drucker", 180,"1999-05-19",null, null,"http://www.imdb.com/title/tt0120689/mediaviewer/rm946247936", "https://youtu.be/uDybmxbKf4Y", "Drama", "Ambientada en el sur de los Estados Unidos, en plena Depresi�n. Paul Edgecomb es un funcionario de prisiones encargado de vigilar la Milla Verde, un pasillo que separa las celdas de los reclusos condenados a la silla el�ctrica. John Coffey, un gigantesco negro acusado de asesinar brutalmente a dos hermanas de nueve a�os est� esperando su inminente ejecuci�n. Tras una personalidad ingenua e infantil, Coffey esconde un prodigioso don sobrenatural. Cuando se presenta la ocasi�n de ponerlo en pr�ctica, Edgecomb aprender� que los milagros existen, incluso en los lugares m�s insospechados");
 INSERT INTO peliculas VALUES(null, "Pirates of Silicon Valley", "Martyn Burke", "Noah Wyle,  Anthony Michael Hall,  Joey Slotnick,  John Di Maggio,  Josh Hopkins, Melissa McBride,  Gailard Sartain,  Marcus Giamatti", 95,"1999-05-19",null, null,"http://www.imdb.com/title/tt0168122/mediaviewer/rm3979606528", "https://youtu.be/hbNyIHvzC4s", "Drama", "Dos j�venes de gran talento se enfrentan en una guerra de ingenio y estrategias comerciales para imponerse en el mercado de la inform�tica. ");	 
