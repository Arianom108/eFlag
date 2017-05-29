package controlador;

import java.io.IOException;
import java.util.ArrayList;
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
import modelo.negocio.*;

/**
 * Servlet implementation class Filter
 */
@WebServlet("/filter")
public class Filter extends HttpServlet {
	private static final long serialVersionUID = 1L;
   // GestionFavoritas rf;
    GestionPelicula gestion;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Filter() {
        super();
        //rf = new GestionFavoritas();
        gestion = new GestionPelicula();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String genero = request.getParameter("genero");
		Usuario user=null;
		List<Pelicula> todas = new ArrayList<Pelicula>();
		RequestDispatcher rd = request.getRequestDispatcher("Peliculas.jsp");
		HttpSession session = request.getSession(false);
		if(session!=null){
			user = (Usuario) session.getAttribute("usuario");
		}
		switch (genero) {
		case "Favoritas":
			List<Pelicula> favoritas = user.getFavoritos();
			if(favoritas==null){
				favoritas = new ArrayList<Pelicula>();
			}
			request.setAttribute("lista", favoritas);
			rd.forward(request, response);	
			break;
		case "Todas":
			todas = gestion.recuperarTodas();
			request.setAttribute("lista", todas);
			rd.forward(request, response);
			break;
		case "Notas":
			todas = gestion.recuperarXnota();
			request.setAttribute("lista", todas);
			rd.forward(request, response);
			break;
		default:
			todas = gestion.recuperarXgenero(genero);
			request.setAttribute("lista", todas);
			rd.forward(request, response);
			break;
		}
	}
}
