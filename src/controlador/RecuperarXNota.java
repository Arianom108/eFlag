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
 * Servlet implementation class RecuperarXNota
 */
@WebServlet("/RecuperarXNota")
public class RecuperarXNota extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionPelicula gestor; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecuperarXNota() {
        super();
        // TODO Auto-generated constructor stub
        gestor = new GestionPelicula();
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
			String nota = (String)request.getParameter("nota");
			if(nota!=null && !nota.isEmpty()){
				List<Pelicula> peliculasXNota = gestor.recuperarXNota();
				response.getWriter().append("Peliculas por nota: ").append(peliculasXNota.toString());
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
