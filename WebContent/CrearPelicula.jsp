<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" %>
    <%@ page import="beans.*"%>
<%@ page import="modelo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang='en'>

<head>
    <title>eFlag</title>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='icon' type='image/png' sizes='16x16' href='image/icon/favicon.ico'>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js '></script>
    <link href="https://fonts.googleapis.com/css?family=Kanit|Open+Sans+Condensed:300i|Orbitron:500" rel="stylesheet">
    <link href='css/style.css' rel='stylesheet'>
</head>

<body>
    <div class="container">
       <div id="headerBg" class="headerBg2 heigthBg"></div>
		<div id="header" class="header heigthBg">
			<div class="header-bar">
				<div class="logo">
					<a href="index.html"> <!--<img src="./images/logo_texto.png" width="100%" alt="">-->eFlag
					</a>
				</div>
				<div id="burger" class="burger">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</div>
				<%
					if (request.getAttribute("error") != null) {
						String error = (String) request.getAttribute("error");
				%>
				<%=error%>
				<%
					}
				%>
				<%
					Usuario user = null;
					HttpSession session = request.getSession(false);
					if (session != null) {
						user = (Usuario) session.getAttribute("usuario");
						//out.println(user.getNombre());
				%>

				<div id="login" class="login">
					<%
						out.println("Hola " + user.getNombre());
					%>
					<form id="form" action="Login" method="post"
						class="form <%out.println("isHide");%>">
						<input type="text" name="email" placeholder="CORREO" required
							tabindex="1"> <input type="password" name="password"
							tabindex="2" placeholder="CONTRASEÑA" required> <br>
						<input tabindex="3" type="submit" value="ENTRAR">
					</form>
					<%
						} else {
					%>
					<div id="login" class="login">

						<form id="form" action="Login" method="post" class="form">
							<input type="text" name="email" placeholder="CORREO" required
								tabindex="1"> <input type="password" name="password"
								tabindex="2" placeholder="CONTRASEÑA" required> <br>
							<input tabindex="3" type="submit" value="ENTRAR">
						</form>
						<%
							}
						%>
						<br> <a href="registro.html" class="registre">Registrate</a>

					</div>
				</div>
				 <div id="main" class="header-main">
					<div class="box">
						<h1>MOVIES eFLAG</h1>
						<p>las mejores peliculas del mundopeliculas del mundo</p>
						<a href="Peliculas.jsp" class="btnMovies">Lista de peliculas</a>
						<a href="CrearPelicula.jsp"
							class="btnMovies <%=(user != null ? " " : "isHide")%>">Crear</a>
						<!-- <a href="peliculas.html" class="btnMovies">Lista de peliculas</a>-->
					</div>
				</div>
        </div>
			</div>
		</div>
           
      
        <div class="crear">
            <h1>REGISTRA PELICULA</h1>
			<div class="error"><% String error=(String)request.getAttribute("error");
			if(error!=null){
				out.println("error al rellenar formulario");
			}%></div>
            <form action="CrearPelicula" method="post" class="form">
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