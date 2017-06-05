package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Pelicula;
import modelo.negocio.GestionPelicula;

/**
 * Servlet implementation class VotarPelicula
 */
@WebServlet("/VotarPelicula")
public class VotarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionPelicula gestorPeliculas;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VotarPelicula() {
		super();
		// TODO Auto-generated constructor stub
		gestorPeliculas = new GestionPelicula();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		int numVotos = Integer.parseInt(request.getParameter("votar"));
		int idPelicula = Integer.parseInt(request.getParameter("id"));
		gestorPeliculas.votarPelicula(gestorPeliculas.recuperaPelicula(idPelicula), numVotos);
		List<Pelicula> peliculas = gestorPeliculas.recuperarTodas();
		request.setAttribute("lista", peliculas);
		RequestDispatcher rd = request.getRequestDispatcher("Peliculas.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
