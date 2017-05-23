package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Usuario;
import modelo.negocio.GestionPelicula;
import modelo.negocio.GestionUsuario;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    GestionUsuario gestionUsuario;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        gestionUsuario = new GestionUsuario();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		Usuario user = new Usuario();
		user.setEmail(email);
		user.setPass(pass);
<<<<<<< HEAD
		Usuario userRecuperado = gestionUsuario.recuperarUsuario(user);
		
//		if( email.equals(userRecuperado.getEmail()) ){
//			if( pass.equals(userRecuperado.getPass())){
	if(user.getEmail().equals(userRecuperado.getEmail() ) && user.getPass().equals(userRecuperado.getPass() )){
				// Iniciamos sesi�n
				HttpSession sesion=request.getSession(true);
				sesion.setMaxInactiveInterval(120);
				sesion.setAttribute("usuario",user);
				response.sendRedirect("index.jsp");
			}else{
=======
		//Usuario userRecuperado = gestionUsuario.recuperarUsuario(user);
		user = gestionUsuario.logarUsuario(user);
		if(user!=null){
			HttpSession sesion=request.getSession(true);
			sesion.setMaxInactiveInterval(120);
			sesion.setAttribute("usuario",user);
			response.sendRedirect("index.jsp");
		}
		else{
>>>>>>> 65d679f6c4dc69cfb774c2f11aa5bada88099f0a
			String error = "Error de Login";
			request.setAttribute("error", error);
			RequestDispatcher rd =  request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
			}
<<<<<<< HEAD
				
=======
		
		//if( email.equals(userRecuperado.getEmail()) ){
			//System.out.println("Emails iguales");
			//if( pass.equals(userRecuperado.getPass())){
				//	if(user.getEmail().equals(userRecuperado.getEmail() ) && user.getPass().equals(userRecuperado.getPass() )){
				// Iniciamos sesi�n
				//HttpSession sesion=request.getSession(true);
				//sesion.setMaxInactiveInterval(120);
				//sesion.setAttribute("usuario",user);
				//response.sendRedirect("index.jsp");
			//}else{
			//String error = "Error de Login";
			//request.setAttribute("error", error);
			//RequestDispatcher rd =  request.getRequestDispatcher("/index.jsp");
			//rd.forward(request, response);
			//}
		
		
>>>>>>> 65d679f6c4dc69cfb774c2f11aa5bada88099f0a
	}

}
