package controlador;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

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
 * Servlet implementation class RecuperarPeliculas
 */
@WebServlet("/RecuperarPeliculas")
public class RecuperarPeliculas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionPelicula gestor;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecuperarPeliculas() {
        super();
        // TODO Auto-generated constructor stub
        gestor = new GestionPelicula();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sesion=request.getSession(false);
		if(sesion == null){
			response.sendRedirect("index.jsp");
		}else{
			
			List<Pelicula> peliculas = gestor.recuperarTodas();
			request.setAttribute("lista", peliculas);
			RequestDispatcher rd = request.getRequestDispatcher("Peliculas.jsp");
			rd.forward(request, response);		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
