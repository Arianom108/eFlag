<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>eFLag | Movies Online</title>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='icon' type='image/png' sizes='16x16' href='image/icon/favicon.ico'>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js '></script>
    <link href="https://fonts.googleapis.com/css?family=Kanit|Open+Sans+Condensed:300i|Orbitron:500" rel="stylesheet">
    <link href='css/style.css' rel='stylesheet'>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
 <div class="container">
        <div id="headerBg" class="headerBg2 heigthBg"></div>
        <div id="header" class="header heigthBg">
            <div class="header-bar">
                <div class="logo">
                    <a href="index.html"><!--<img src="./images/logo_texto.png" width="100%" alt="">-->eFlag</a>
                </div>
                <div id="burger" class="burger">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </div>
                <div id="Login" class="login">
                    <form id="form" action="login" method="post" class="form">
                        <input type="text" name="user" placeholder="USUARIO" required tabindex="1">
                        <input type="password" name="password" tabindex="2" placeholder="CONTRASEÑA" required>
                        <br><input tabindex="3" type="submit" value="ENTRAR">

                    </form><br><a href="registro.html" class="registre">Registrate</a>

                </div>
                 </div>
            <div id="main" class="header-main">
                <div class="box">
                    <h1>MOVIES eFLAG</h1>
                    <p>las mejores peliculas del mundopeliculas del mundo</p>
                    <a href="peliculas.jsp" class="btnMovies">Lista de peliculas</a>
                    <a href="crear.jsp" class="btnMovies">Crear</a>
                    <!-- <a href="peliculas.html" class="btnMovies">Lista de peliculas</a>-->
                </div>
                </div>
        </div>
         <div class="section">
            <div class="filter">
            <form id="filter" action="filter" class="filter-form" method="post">
                  Realiza un Busqueda   <select name="genero">                 
      <option value="Animacion">Animacion
      <option value="Aventuras" selected>Aventuras
      <option value="Comedia">Comedia
      <option value="Accion">Accion
      <option value="Drama">Drama
      <option value="Terro">Terro
      <option value="Ciencia Ficcion">Ciencia Ficcion
       <option value="Romantica">Romantica
      <option value="Historica">Historica
      <option value="Corto">Corto
      <option value="Favoritos">Favoritos
      <option value="Populares">Populares
					</select>
         <input type="submit" value="Busqueda"></form>
            </div>
            <div class="movies">
            <div class="movies-item">
                    <div class="movies-item-image"><img src="http://hdqwalls.com/download/superman-in-batman-vs-superman-movie-1024x1204.jpg" alt="" width="100%"></div>
                    <div class="movies-item-content">
                        <a href="marcar"> <i class="fa fa-star fa-2x isFavorite" aria-hidden="true"></i></a><a href="peliculas.html">SUPERMAN</a>
                    </div>
                     <a class="eye" href="peliculas.jsp">Ver</a>
                    <div class="movies-item-detail">
                        <div class="detail">valoracion: <span>7,3</span> <br> genero: <span>accion</span> <br> año: <span>2017</span></div>
                        <form class="votar" action="votar" method="post">
                            <span>Votar</span> <select name="votar" id="">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                            </select>
                            <input type="submit" value="Enviar"></form>
                        </form>
                       </div>
                </div>
                <div class="movies-item">
                    <div class="movies-item-image"><img src="http://www.elmulticine.com/imagenes/carteles/3/ninos-grandes-2-poster-b.jpg" alt="" width="100%"></div>
                    <div class="movies-item-content">
                        <i class="fa fa-star fa-2x isFavorite" aria-hidden="true"></i><a href="peliculas.html">NIÑOS GRANDES 2</a>
                    </div>
                    <a class="eye" href="peliculas.html">Ver</a>
                    <div class="movies-item-detail">
                        valoracion: <span>5,8</span> <br>genero: <span>comedia</span><br> año: <span>2017</span>
                    </div>
                </div>
                <div class="movies-item">
                    <div class="movies-item-image"><img src="http://4.bp.blogspot.com/-1aTgAcMkoCk/VgIzFaOLSAI/AAAAAAAAA8I/jDewVAvo6sU/s1600/Avengers%2B2%2B800x1200.JPG" alt="" width="100%"></div>
                    <div class="movies-item-content">
                        <i class="fa fa-star fa-2x isFavorite" aria-hidden="true"></i> <a href="peliculas.html">AVENGERS</a>
                    </div>
                    <a class="eye" href="peliculas.html">Ver</a>
                    <div class="movies-item-detail">
                        valoracion: <span>8,4</span><br>ficcion: <span>accion</span> <br>año: <span>2017</span>
                    </div>
                </div>
                 <div class="movies-item">
                    <div class="movies-item-image"><img src="http://3.bp.blogspot.com/-ZxikvAz0V_A/TcSVqy2tCTI/AAAAAAAACi8/5gmlIHBxX9s/s1600/Exorcist%252BExorcista%252BThe%252B1973%252Bposter.jpg" alt="" width="100%"></div>
                    <div class="movies-item-content">
                        <i class="fa fa-star fa-2x isFavorite" aria-hidden="true"></i> <a href="peliculas.html">EXORCISTA</a>
                    </div>
                    <a class="eye" href="peliculas.html">Ver</a>
                    <div class="movies-item-detail">
                        valoracion: <span>9,1</span> <br>genero: <span>TERROR</span><br> año: <span>2017</span>
                    </div>
                </div>
                <div class="movies-item">
                    <div class="movies-item-image"><img src="http://4.bp.blogspot.com/-1aTgAcMkoCk/VgIzFaOLSAI/AAAAAAAAA8I/jDewVAvo6sU/s1600/Avengers%2B2%2B800x1200.JPG" alt="" width="100%"></div>
                    <div class="movies-item-content">
                        <i class="fa fa-star fa-2x isFavorite" aria-hidden="true"></i> <a href="peliculas.html">AVENGERS</a>
                    </div>
                    <a class="eye" href="peliculas.html">Ver</a>
                    <div class="movies-item-detail">
                        valoracion: <span>8,4</span><br>ficcion: <span>accion</span> <br>año: <span>2017</span>
                    </div>
                </div>
                <div class="movies-item">
                    <div class="movies-item-image"><img src="http://3.bp.blogspot.com/-ZxikvAz0V_A/TcSVqy2tCTI/AAAAAAAACi8/5gmlIHBxX9s/s1600/Exorcist%252BExorcista%252BThe%252B1973%252Bposter.jpg" alt="" width="100%"></div>
                    <div class="movies-item-content">
                        <i class="fa fa-star fa-2x isFavorite" aria-hidden="true"></i> <a href="peliculas.html">EXORCISTA</a>
                    </div>
                    <a class="eye" href="peliculas.html">Ver</a>
                    <div class="movies-item-detail">
                        valoracion: <span>9,1</span> <br>genero: <span>TERROR</span><br> año: <span>2017</span>
                    </div>
                </div>
                <div class="movies-item">
                    <div class="movies-item-image"><img src="http://hdqwalls.com/download/superman-in-batman-vs-superman-movie-1024x1204.jpg" alt="" width="100%"></div>
                    <div class="movies-item-content">
                        <i class="fa fa-star fa-2x isFavorite" aria-hidden="true"></i> <a href="peliculas.html">SUPERMAN</a>
                    </div>
                    <a class="eye" href="peliculas.html">Ver</a>
                    <div class="movies-item-detail">
                        valoracion: <span>7,3</span> <br> genero: <span>accion</span> <br> año: <span>2017</span>
                    </div>
                </div>
                <div class="movies-item">
                    <div class="movies-item-image"><img src="http://www.elmulticine.com/imagenes/carteles/3/ninos-grandes-2-poster-b.jpg" alt="" width="100%"></div>
                    <div class="movies-item-content">
                        <i class="fa fa-star fa-2x isFavorite" aria-hidden="true"></i> <a href="peliculas.html">NIÑOS GRANDES 2</a>
                    </div>
                    <a class="eye" href="peliculas.html">Ver</a>
                    <div class="movies-item-detail">
                        valoracion: <span>5,8</span> <br>genero: <span>comedia</span><br> año: <span>2017</span>
                    </div>
                </div>
            </div>
            <div class="content2">
                <div class="content2-box">
                    <p> in eaque, blanditiis natus voluptates rem laudantium dolorem tenetur corporis maiores, sint excepturi dolor tempore nemo quae hic ullam, fugiat provident.</p>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="footer-box">by development <span>&</span> design eFlag 2017</div>
    </footer>


    <!-- FUENTE DE ICONOS DE FONTAWESOME -->
    <script async type='text/javascript' src='https://use.fontawesome.com/493ef35f7a.js'></script>
    <!-- HOJA DE JAVASCRIPT -->
    <script async type='text/javascript' src='js/js.js'></script>

</body>
</html>