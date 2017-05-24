<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@ page import="beans.*"%>
<%@ page import="modelo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang='en'>

<head>
<title>eFlag</title>
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
</head>

<body>
	<div class="container">
		<div id="headerBg" class="headerBg3 heigthBg"></div>
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
		</div>

		<div class="crear">
			<h1>REGISTRAR USUARIO</h1>
			<div class="error">
				<%
					String error = (String) request.getAttribute("error");
					if (error != null) {
						out.println("error al rellenar formulario");
					}
				%>
			</div>

			<form action="RegistrarUsuario" method="post" class="form">
				<span>NOMBRE</span> <input type="text" name="name" required	tabindex="1" placeholder="nombre"> 
				<span>E-MAIL</span><input	type="email" name="email" required tabindex="2" placeholder="email">
				<span>CONTRASEÑA</span><input type="text" name="password"	tabindex="3" required placeholder="contraseña"> 
				<input tabindex="4"	type="submit" value="Crear Usuario">
			</form>

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