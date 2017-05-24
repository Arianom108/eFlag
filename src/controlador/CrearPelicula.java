package controlador;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Pelicula;
import modelo.negocio.GestionPelicula;

/**
 * Servlet implementation class CrearPelicula
 */
@WebServlet("/CrearPelicula")
public class CrearPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionPelicula gestor;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CrearPelicula() {
		super();
		// TODO Auto-generated constructor stub

		gestor = new GestionPelicula();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession(false);

		if (session != null) {
			String titulo = request.getParameter("title");
			String directores = request.getParameter("directors");
			String actores = request.getParameter("actors");
			int duracion = Integer.parseInt(request.getParameter("time"));
			String fecha = request.getParameter("date");
			String caratula = request.getParameter("poster");
			String trailer = request.getParameter("video");
			String sinopsis = request.getParameter("sinopsis");

			String[] generos = request.getParameterValues("ck1");
			
			// System.out.println(date.toString());

			Pelicula peli = new Pelicula();
			peli.setTitulo(titulo);
			peli.setDirectores(directores);
			peli.setActores(actores);
			peli.setDuracion(duracion);
			peli.setFecha(fecha);
			peli.setCaratula(caratula);
			peli.setTrailer(trailer);
			String cadena = new String();
			for (int i = 0; i < generos.length; i++) {
				cadena += " " + generos[i];
			}
			peli.setGeneros(cadena);
			peli.setSinopsis(sinopsis);
			boolean resp=gestor.crearPelicula(peli);
			if (resp) {
				RequestDispatcher rd = request.getRequestDispatcher("Peliculas.jsp");
				rd.forward(request, response);
			} else {
				String error = "error";
				request.setAttribute("error", error);
				RequestDispatcher rd = request.getRequestDispatcher("CrearPelicula.jsp");
				rd.forward(request, response);
			}

		} else {

			response.sendRedirect("index.jsp");

		}
	}
}
