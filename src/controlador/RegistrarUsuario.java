package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Usuario;
import modelo.negocio.GestionUsuario;

/**
 * Servlet implementation class RegistrarUsuario
 */
@WebServlet("/RegistrarUsuario")
public class RegistrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionUsuario gestionUsuario;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarUsuario() {
        super();
        gestionUsuario = new GestionUsuario();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre= request.getParameter("user");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		Usuario user = new Usuario();
		user.setNombre(nombre);
		user.setPass(pass);
		user.setEmail(email);
		if(gestionUsuario.registrarUsuario(user)){
			response.sendRedirect("index.jsp");
		}else{
			response.getWriter().println("No se ha podido registrar el usuario");
			response.sendRedirect("index.jsp");
		}
	}

}
