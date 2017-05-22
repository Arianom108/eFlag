package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Pelicula;
import modelo.negocio.GestionPelicula;
import beans.Usuario;




/**
 * Servlet implementation class CrearPelicula
 */
@WebServlet("/CrearPelicula")
public class CrearPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       GestionPelicula gestor ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearPelicula() {
        super();
        // TODO Auto-generated constructor stub
        
        gestor= new GestionPelicula();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession(false);
		
		if( session!= null){
			
			String titulo = request.getParameter("titulo");
			String directores = request.getParameter("directores");
			String actores = request.getParameter("actores");
			int duracion= Integer.parseInt(request.getParameter("duracion"));
			String fecha = request.getParameter("fecha");
			String caratula= request.getParameter("caratula");
			String trailer = request.getParameter("trailer");
			String generos= request.getParameter("generos");
			String sinopsis = request.getParameter("sinopsis");
		
			
			Pelicula  peli = new Pelicula();
			peli.setTitulo(titulo);
			peli.setDirectores(directores);
			peli.setActores(actores);
			peli.setDuracion(duracion);
			peli.setFecha(fecha);
			peli.setCaratula(caratula);
			peli.setTrailer(trailer);
			peli.setGeneros(generos);
			peli.setSinopsis(sinopsis);
			gestor.crearPelicula(peli);
			
			response.sendRedirect("lista.jsp");
			}
		
		else{
				
				response.sendRedirect("index.jsp");
			}
		}}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
		
		
		
		
	


