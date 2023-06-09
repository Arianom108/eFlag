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

		user = gestionUsuario.logarUsuario(user);
		if(user!=null){
			HttpSession sesion=request.getSession(true);
			sesion.setMaxInactiveInterval(600);
			sesion.setAttribute("usuario",user);
			RequestDispatcher rd =  request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
		else{

			String error = "Error de Login";
			request.setAttribute("error", error);
			RequestDispatcher rd =  request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			}
	}
}
