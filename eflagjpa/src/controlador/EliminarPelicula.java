package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.negocio.GestionPelicula;

/**
 * Servlet implementation class EliminarPelicula
 */
@WebServlet("/EliminarPelicula")
public class EliminarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionPelicula gestor;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarPelicula() {
        super();
        gestor = new GestionPelicula();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion=request.getSession(false);
		if(sesion == null){
			response.sendRedirect("index.jsp");
		}else{
			int id = Integer.parseInt(request.getParameter("id"));
			gestor.eliminarPelicula(id);
			response.sendRedirect("lista.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);

	}

}
