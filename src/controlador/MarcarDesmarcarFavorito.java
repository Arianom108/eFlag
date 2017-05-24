package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Pelicula;
import beans.Usuario;
import modelo.negocio.GestionFavoritas;
import modelo.negocio.GestionPelicula;

/**
 * Servlet implementation class MarcarDesmarcarFavorito
 */
@WebServlet("/MarcarDesmarcarFavorito")
public class MarcarDesmarcarFavorito extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionFavoritas gestorFavoritas;
	GestionPelicula gestorPeliculas;

	public MarcarDesmarcarFavorito() {
		super();
		gestorFavoritas = new GestionFavoritas();
		gestorPeliculas = new GestionPelicula();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion = request.getSession(false);
		if (sesion == null) {
			response.sendRedirect("Peliculas.jsp");
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
			Usuario user = (Usuario) sesion.getAttribute("usuario");
			gestorFavoritas.modificarFavoritas(id, user);
			List<Pelicula> peliculas = gestorPeliculas.recuperarTodas();
			request.setAttribute("lista", peliculas);
			RequestDispatcher rd = request.getRequestDispatcher("Peliculas.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
