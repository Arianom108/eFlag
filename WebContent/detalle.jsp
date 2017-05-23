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
			</div>
		     <div class="movie">
		     <% Pelicula movie =(Pelicula)request.getAttribute("pelicula"); %>
            <div class="movie-image">

                <img src="<%=movie.getCaratula() %>" alt="<%=movie.getTitulo() %>">
            </div>
            <div class="movie-text">
                <h2 class="movie-title"><%=movie.getTitulo() %></h2>
                <div class="movie-summary">
                    <p><%=movie.getSinopsis() %></p>
                </div>
                <ul class="movie-meta">
                    <li><strong>nota:</strong><%=movie.getNota_media() %></li>
                    <li><strong>Genero:</strong> <%=movie.getGeneros() %></li>
                    <li><strong>Votos:</strong> <%=movie.getNumero_votos() %></li>
                    <li><strong>Duracion:</strong> <%=movie.getDuracion() %></li>
                    <li><strong>Fecha Estreno: </strong><%=movie.getFecha() %> </li>
                </ul>

                <ul class="starring">
                    <li><strong>Director:</strong> <%=movie.getDirectores()%></li>
                    <li><strong>Reparto:</strong> <%=movie.getActores() %></li>
                </ul>
                <a href="marcar"> <i class="fa fa-star fa-2x isFavorite" aria-hidden="true"></i></a>

            </div>
        </div>
        <div class="trailer">
            <div class="movie-meta"><a href="<%=movie.getTrailer() %>">Ver Trailer</a></div>

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