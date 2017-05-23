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
 * Servlet implementation class RecuperarFavoritos
 */
@WebServlet("/RecuperarFavoritos")
public class RecuperarFavoritos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       GestionFavoritas favoritas ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecuperarFavoritos() {
        super();
        // TODO Auto-generated constructor stub
        
        favoritas = new GestionFavoritas();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession sesion=request.getSession(false);
		if(sesion == null){
			response.sendRedirect("index.jsp");
		}else{
			Usuario  user=(Usuario)sesion.getAttribute("user");		
					
			List <Pelicula> peliculasFavoritas = favoritas.recuperarFavoritas(user);
			
			request.setAttribute("peliculasFavoritas", peliculasFavoritas);
			RequestDispatcher rd = request.getRequestDispatcher("Peliculas.jsp");
			rd.forward(request, response);			
		}
	}	
}
