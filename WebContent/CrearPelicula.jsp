<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" import="beans.*"%>
    <%@ page import="modelo.negocio.GestionPelicula"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>eFLag | Movies Online</title>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='icon' type='image/png' sizes='16x16' href='image/icon/favicon.ico'>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js '></script>
    <link href="https://fonts.googleapis.com/css?family=Kanit|Open+Sans+Condensed:300i|Orbitron:500" rel="stylesheet">
    <link href='css/style.css' rel='stylesheet'>
</head>
<body>



<div class="container">
        <div id="headerBg" class="headerBg3 heigthBg"></div>
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
                <div id="login" class="login">
                    <form id="form" action="CrearPelicula" method="post" class="form">
                        <input type="text" name="user" placeholder="USUARIO" required tabindex="1">
                        <input type="password" name="password" tabindex="2" placeholder="CONTRASEŅA" required>
                        <br><input tabindex="3" type="submit" value="ENTRAR">

                    </form><br><a href="registro.jsp" class="registre">Registrate</a>

                </div>
            </div>
            <div id="main" class="header-main">
                <div class="box">
                    <h1>MOVIES eFLAG</h1>
                    <p>las mejores peliculas del mundopeliculas del mundo</p>
                    <a href="peliculas.html" class="btnMovies">Lista de peliculas</a>
                    <a href="peliculas.html" class="btnMovies">Crear</a>
                    <!-- <a href="peliculas.html" class="btnMovies">Lista de peliculas</a>-->
                </div>
            </div>
        </div>
        <div class="crear">
            <h1>REGISTRA PELICULA</h1>
             <% 
HttpSession sesion =request.getSession(false);
if(sesion == null){
	response.sendRedirect("index.jsp");
}else{
	Usuario user = (Usuario)sesion.getAttribute("usuario");
	GestionPelicula gestor ;
	String titulo = request.getParameter("title");
	String directores = request.getParameter("directors");
	String actores = request.getParameter("actors");
	int duracion= Integer.parseInt(request.getParameter("time"));
	String fecha = request.getParameter("date");
	String caratula= request.getParameter("poster");
	String trailer = request.getParameter("video");
	String[] generos= request.getParameterValues("ck1");
	String sinopsis = request.getParameter("sinopsis");

	Pelicula  peli = new Pelicula();
	peli.setTitulo(titulo);
	peli.setDirectores(directores);
	peli.setActores(actores);
	peli.setDuracion(duracion);
	peli.setFecha(fecha);
	peli.setCaratula(caratula);
	peli.setTrailer(trailer);	
	peli.setGeneros(generos);
	peli.setSinopsis(sinopsis);
	gestor.crearPelicula(peli);

	
	response.sendRedirect("lista.jsp");
}
		%>
			<form action="crear" method="post" class="form">
                <span>TITULO</span> <input type="text" name="title" required tabindex="1" placeholder="titulo">
                <span>SINOPSIS</span><input type="textarea" name="sinopsis" tabindex="2" required placeholder="sinopsis">
                <span>FECHA</span><input type="date" name="date" required tabindex="3">
                <span>DURACION</span><input type="text" name="time" tabindex="4" required placeholder="duracion">
                <span>ACTORES</span><input type="text" name="actors" tabindex="5" required placeholder="actores">
                <span>DIRECTORES</span><input type="text" name="directors" required tabindex="6" placeholder="directores">

                <span>CARATULA</span>
                <input type="text" name="poster" required tabindex="7" placeholder="url-image">
                <span>VIDEO</span><input type="text" name="video" required tabindex="8" placeholder="url-video">
                <span>GENERO</span>
                <div class="checkbox">
                    <span>ANIMACION</span><input type="checkbox" name="ck1" value="animation">
                    <span>AVENTURA</span><input type="checkbox" name="ck1"value="aventure" >
                    <span>COMEDIA</span><input type="checkbox" name="ck1" value="comedy">
                    <span>ACCION</span><input type="checkbox" name="ck1" value="accion">
                    <span>DRAMA</span><input type="checkbox" name="ck1" value="drama">
                    <span>TERROR</span><input type="checkbox" name="ck1" value="terror">
                    <span>ROMANTICA</span><input type="checkbox" name="ck1" value="romantic">
                    <span>HISTORICA</span><input type="checkbox" name="ck1" value="history">
                    <span>CORTO</span><input type="checkbox" name="ck1" value="corto">
                    <span>CIENCIA FICCION</span><input type="checkbox" name="ck1" value="ficcion">
                </div>
                <input type="submit" value="Crear Pelicula">
            </form>

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