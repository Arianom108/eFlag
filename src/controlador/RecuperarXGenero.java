package controlador;

import java.io.IOException;
import java.util.List;

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
			String genero = (String)request.getParameter("genero");
			if(genero!=null && !genero.isEmpty()){
				List<Pelicula> peliculasXGenero = gestor.recuperarXGenero(genero);
				response.getWriter().append("Peliculas por genero: ").append(peliculasXGenero.toString());
				response.sendRedirect("lista.jsp");
			}
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
