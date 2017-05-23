<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.* " session="false"%>
<%@ page import="modelo.negocio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>eFLag | Movies Online</title>

<meta name='viewport' content='width=devicewidth, initialscale=1'>
<link rel='icon' type='image/png' sizes='16x16'
	href='image/icon/favicon.ico'>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js '></script>
<link
	href="https://fonts.googleapis.com/css?family=Kanit|OpenSansCondensed:300i|Orbitron:500"
	rel="stylesheet">
<link href='css/style.css' rel='stylesheet'>

</head>
<body>
	<div class="container">
		<div id="headerBg" class="headerBg2 heigthBg"></div>
		<div id="header" class="header heigthBg">
			<div class="header-bar">
				<div class="logo">
					<a href="index.jsp"> <!--<img src="./images/logo_texto.png" width="100%" alt="">-->eFlag
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
						<br> <a href="Registro.jsp" class="registre">Registrate</a>

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
		<div class="section">
			<div class="filter">
				<form id="filter" action="filter" class="filter-form" method="post">
					Realiza un Busqueda <select name="genero">
						<% if(user!=null){ %>
						<option name="Favoritas" value="Favoritas">Favoritas</option>
						<%} %> 
						<option name="Todas" value="Todas">Todas</option>
						<option name="Animación" value="animacion">Animación</option>
						<option name="Aventuras" value="aventuras">Aventuras</option>
						<option name="Comedia" value="comedia">Comedia</option>
						<option name="Acción" value="accion">Acción</option>
						<option name="Drama" value="drama">Drama</option>
						<option name="Terror" value="terror">Terror</option>
						<option name="Ficción" value="ficcion">Ciencia Ficción</option>
						<option name="Romántica" value="romantica">Romántica</option>
						<option name="Histórica" value="historica">Histórica</option>
						<option name="Corto" value="corto">Corto</option>
						<option name="Populares" value="populares">Populares</option>
						<option name="Notas" value="Notas">Por nota</option>
					</select> <input type="submit" value="Busqueda">
				</form>
			</div>
			<div class="movies">
				<%
					List<Pelicula> listFavorites = null;
					GestionPelicula gestorPelicula = new GestionPelicula();
					GestionFavoritas gestorFavoritas = new GestionFavoritas();
					List<Pelicula> list = (ArrayList<Pelicula>) request.getAttribute("lista");
					if (user != null) {
						listFavorites = gestorFavoritas.recuperarFavoritas(user);
					}
					if (list == null) {
						list = gestorPelicula.recuperarTodas();
					}
					for (Pelicula l : list) {
				%>
				<div class="movies-item">
					<div class="movies-item-image">
						<img src="<%=l.getCaratula()%>" alt="<%=l.getTitulo()%>"
							width="100%">
					</div>
					<div class="movies-item-content">
						<a class="<%=(user != null) ? " " : "isHide"%>"
							href="MarcarDesmarcarFavorito?id=<%=l.getId_pelicula()%>"> <i
							class="fa fa-star fa-2x 
							<%if (user != null) {
					for (Pelicula p : listFavorites) {
						if (p.getId_pelicula() == l.getId_pelicula()) {
							out.println("isFavorite");
						}
					}
				}%>"
							aria-hidden="true"></i></a> <a
							href="RecuperarPelicula?id=<%=l.getId_pelicula()%>"><%=l.getTitulo() %></a>
					</div>
					<a class="eye" href="RecuperarPelicula?id=<%=l.getId_pelicula()%>">Ver</a>
					<div class="movies-item-detail">
						<div class="detail">
							valoracion: <span><%=l.getNota_media()%></span> <br>
							genero: <span><%=l.getGeneros()%></span> <br> año: <span><%=l.getFecha()%></span>
						</div>
						<form class="votar <%=(user != null) ? " " : "isHide"%>"
							action="VotarPelicula?id=<%=l.getId_pelicula()%>" method="post">
							<span>Votar</span> <select name="votar">
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
							</select> <input type="submit" value="Enviar">
						</form>
					</div>
				</div>
				<%
					}
				%>
				<div class="content2">
					<div class="content2-box">
						<p>in eaque, blanditiis natus voluptates rem laudantium
							dolorem tenetur corporis maiores, sint excepturi dolor tempore
							nemo quae hic ullam, fugiat provident.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
	<div class="footer-box">
		by development <span>&</span> design eFlag 2017
	</div>
	</footer>
	<!-- FUENTE DE ICONOS DE FONTAWESOME -->
	<script async type='text/javascript'
		src='https://use.fontawesome.com/493ef35f7a.js'></script>
	<!-- HOJA DE JAVASCRIPT -->
	<script async type='text/javascript' src='js/js.js'></script>
</body>
</html>