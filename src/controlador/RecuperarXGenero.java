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
import modelo.negocio.GestionPelicula;

/**
 * Servlet implementation class RecuperarXGenero
 */
@WebServlet("/RecuperarXGenero")
public class RecuperarXGenero extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionPelicula gestor; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecuperarXGenero() {
        super();
        gestor = new GestionPelicula();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion=request.getSession(false);
		if(sesion == null){
			response.sendRedirect("index.jsp");
		}else{
			String genero = request.getParameter("generos");
		
				List<Pelicula> peliculasXGenero = gestor.recuperarXgenero(genero);
				request.setAttribute("peliculasXGenero", peliculasXGenero);
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
