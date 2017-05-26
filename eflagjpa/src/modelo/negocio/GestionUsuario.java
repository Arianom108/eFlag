package modelo.negocio;

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

}
