package controlador;


import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Pelicula;
import beans.Usuario;
import modelo.negocio.GestionPelicula;
/**
 * Servlet implementation class RecuperarFavoritos
 */
@WebServlet("/RecuperarFavoritos")
public class RecuperarFavoritos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       GestionPelicula favoritos ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecuperarFavoritos() {
        super();
        // TODO Auto-generated constructor stub
        
        favoritos = new GestionPelicula();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion=request.getSession(false);
		if(sesion == null){
			response.sendRedirect("index.jsp");
		}else{
			// TODO  De donde se saca el usuario??
		
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			String nombre = (String)request.getParameter("nombre");
			
			String pass = (String)request.getParameter("pass");
			String email = (String)request.getParameter("email");
			Usuario usuario = new Usuario (id, nombre, pass, email);
			java.util.List <Pelicula> peliculasFavoritas = favoritos.recuperarFavoritas(usuario);
			response.getWriter().append("Peliculas favoritas: ").append(peliculasFavoritas.toString());
			response.sendRedirect("lista.jsp");
		}
	}	
}
