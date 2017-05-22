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

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
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
		String pass = request.getParameter("password");
		Usuario user = new Usuario();
		user.setNombre(nombre);
		user.setPass(pass);
		if(user!=null){
			// Iniciamos sesi�n
			HttpSession sesion=request.getSession(true);
			sesion.setMaxInactiveInterval(120);
			sesion.setAttribute("usuario",user);
			response.sendRedirect("index.jsp");
		}else{
			String error = "Error de Login";
			request.setAttribute("error", error);
			RequestDispatcher rd =  request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			}
	}

}
