<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@ page import="beans.* " session="false"%>
<%@ page import="modelo.negocio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MOVIES eFLAG</title>
<meta charset='UTF-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='icon' type='image/png' sizes='16x16'
	href='image/icon/favicon.ico'>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js '></script>
<link
	href="https://fonts.googleapis.com/css?family=Kanit|Open+Sans+Condensed:300i|Orbitron:500"
	rel="stylesheet">
<link href='css/style.css' rel='stylesheet'>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
	<div class="container">
		<div class="headerBg"></div>
		<div class="header">
			<div class="header-bar">
				<div class="logo">
					<a href="index.jsp">
						<!--  <img src="./images/logo_eflag1.png" width="100%" alt="">-->eFlag
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
				<%
					out.println("<div class='error'>" + error + "</div>");
				%>
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
						out.println("<div class='login-user'>hola " + user.getNombre() + "</div>");
							out.println("<a class='login-cerrar' href='CerrarSession'>CERRAR</a> ");
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
						</form>
						<br>

					</div>
				</div>
				<div id="main" class="header-main">
					<div class="box">
						<h1>MOVIES eFLAG</h1>
						<p>las mejores peliculas del mundopeliculas del mundo</p>
						<a href="Peliculas.jsp" class="btnMovies">Lista de peliculas</a> <a
							href="CrearPelicula.jsp"
							class="btnMovies <%=(user != null ? " " : "isHide")%>">Crear</a>
						<!-- <a href="peliculas.html" class="btnMovies">Lista de peliculas</a>-->
					</div>
				</div>
			</div>
			<div class="section">
				<div class="page">
					<div class="page-item">
						<div class="icon">
							<i class="fa fa-film fa-5x" aria-hidden="true"></i>
						</div>
						<h2>ACCION</h2>
						<div class="text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Dolorum delectus quia, quaerat praesentium vel!
							Tenetur quisquam magnam sequi, ratione non?</div>
					</div>

					<div class="page-item">
						<div class="icon">
							<i class="fa fa-video-camera fa-5x" aria-hidden="true"></i>
						</div>
						<h2>TERROR</h2>
						<div class="text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Dolorum delectus quia, quaerat praesentium vel!
							Tenetur quisquam magnam sequi, ratione non?</div>
					</div>

					<div class="page-item">
						<div class="icon">
							<i class="fa fa-star fa-5x" aria-hidden="true"></i>
						</div>
						<h2>AVENTURA</h2>
						<div class="text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Dolorum delectus quia, quaerat praesentium vel!
							Tenetur quisquam magnam sequi, ratione non?</div>
					</div>
				</div>
				<div class="content">
					<div class="content-box">
						<p>in eaque, blanditiis natus voluptates rem laudantium
							dolorem tenetur corporis maiores, sint excepturi dolor tempore
							nemo quae hic ullam, fugiat provident.</p>
					</div>
				</div>
<<<<<<< HEAD
				<div class="movies">

					<div class="movies-item">
						<div class="movies-item-image">
							<img
								src="http://hdqwalls.com/download/superman-in-batman-vs-superman-movie-1024x1204.jpg"
								alt="" width="100%">
						</div>
						<div class="movies-item-content">
							<a href="Peliculas.jsp">SUPERMAN</a>
						</div>
						<a class="eye" href="Peliculas.jsp">Ver</a>
						<div class="movies-item-detail">
							<div class="detail">
								valoracion: <span>7,3</span> <br> genero: <span>accion</span>
								<br> año: <span>2017</span>
							</div>
=======
			</div>
		
		<div class="section">			
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
						list = gestorPelicula.recuperarXgenero("terror");
					}
				
					for (Pelicula l : list) {
					//for (int i=0;i<list.size();i++){
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
>>>>>>> 84a917d733c1c234306cbeb2887ebf3ba754fee3
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
<<<<<<< HEAD
					<div class="movies-item">
						<div class="movies-item-image">
							<img
								src="http://www.elmulticine.com/imagenes/carteles/3/ninos-grandes-2-poster-b.jpg"
								alt="" width="100%">
						</div>
						<div class="movies-item-content">
							<a href="Peliculas.jsp">NIÑOS GRANDES 2</a>
						</div>
						<a class="eye" href="Peliculas.jsp">Ver</a>
						<div class="movies-item-detail">
							<div class="detail">
								valoracion: <span>5,8</span> <br>genero: <span>comedia</span><br>
								año: <span>2017</span>
							</div>
						</div>
					</div>
					<div class="movies-item">
						<div class="movies-item-image">
							<img
								src="http://4.bp.blogspot.com/-1aTgAcMkoCk/VgIzFaOLSAI/AAAAAAAAA8I/jDewVAvo6sU/s1600/Avengers%2B2%2B800x1200.JPG"
								alt="" width="100%">
						</div>
						<div class="movies-item-content">
							<a href="Peliculas.jsp">AVENGERS</a>
						</div>
						<a class="eye" href="Peliculas.jsp">Ver</a>
						<div class="movies-item-detail">
							<div class="detail">
								valoracion: <span>8,4</span><br>ficcion: <span>accion</span>
								<br>año: <span>2017</span>
							</div>
						</div>
					</div>
					<div class="movies-item">
						<div class="movies-item-image">
							<img
								src="http://3.bp.blogspot.com/-ZxikvAz0V_A/TcSVqy2tCTI/AAAAAAAACi8/5gmlIHBxX9s/s1600/Exorcist%252BExorcista%252BThe%252B1973%252Bposter.jpg"
								alt="" width="100%">
						</div>
						<div class="movies-item-content">
							<a href="Peliculas.jsp">EXORCISTA</a>
						</div>
						<a class="eye" href="Peliculas.jsp">Ver</a>
						<div class="movies-item-detail">
							<div class="detail">
								valoracion: <span>9,1</span> <br>genero: <span>TERROR</span><br>
								año: <span>2017</span>
							</div>
						</div>
					</div>
				</div>
=======
				</div>
				<%
					}//cierre del for para la lista
				%>
>>>>>>> 84a917d733c1c234306cbeb2887ebf3ba754fee3
				<div class="content2">
					<div class="content2-box">
						<p>in eaque, blanditiis natus voluptates rem laudantium
							dolorem tenetur corporis maiores, sint excepturi dolor tempore
							nemo quae hic ullam, fugiat provident.</p>
					</div>
				</div>
			</div>
<<<<<<< HEAD


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
=======
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
>>>>>>> 84a917d733c1c234306cbeb2887ebf3ba754fee3
</body>
</html>