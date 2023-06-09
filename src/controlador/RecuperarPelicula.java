package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.*;
import modelo.negocio.GestionPelicula;

/**
 * Servlet implementation class RecuperarPelicula
 */
@WebServlet("/RecuperarPelicula")
public class RecuperarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionPelicula gestor;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecuperarPelicula() {
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
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		//HttpSession sesion = request.getSession(false);
		//Usuario user = (Usuario) sesion.getAttribute("usuario");
		int id = Integer.parseInt(request.getParameter("id"));
		Pelicula pelicula = gestor.recuperaPelicula(id);
		//sesion.setAttribute("usuario", user);
		request.setAttribute("pelicula", pelicula);
		RequestDispatcher rd = request.getRequestDispatcher("detalle.jsp");
		rd.forward(request, response);

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
