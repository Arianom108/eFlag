package modelo.negocio;

import java.util.List;

import beans.Pelicula;
import beans.Usuario;
import modelo.DAO.UsuarioDAO;

public class GestionUsuario {
	UsuarioDAO daoUser;

	public GestionUsuario() {
		daoUser = new UsuarioDAO();
	}

	public boolean crearUsuario(Usuario user) {
		daoUser.iniciarTransaccion();
		boolean r = daoUser.crearUsuario(user);
		daoUser.cerrarTransaccion();
		return r;
	}

	public Usuario recuperarUsuario(Usuario user) {
		return daoUser.recuperarUsuario(user);
	}

	public Usuario logarUsuario(Usuario userPorLogar) {
		Usuario userRecuperado = daoUser.recuperarUsuario(userPorLogar);
		if (userRecuperado != null && userRecuperado.getPass().equals(userPorLogar.getPass())) {
			return userRecuperado;
		} else {
			return null;
		}

	}
	
	public List<Pelicula> recuperarFavoritas(Usuario usuario){
		return daoUser.recuperarUsuario(usuario).getFavoritos();
	}

}
