package modelo.negocio;

import beans.Usuario;
import dao.UsuarioDao;
import modelo.DAO.UsuarioDAO;

public class GestionUsuario {
	UsuarioDAO daoUser;
	
	public GestionUsuario(){
		daoUser = new UsuarioDAO();
	}
	
	public boolean crearUsuario(Usuario user){
		return daoUser.crearUsuario(user);
	}
	
	public Usuario recuperarUsuario(Usuario user){
		return daoUser.recuperarUsuario(user);
	}
	
	public Usuario logarUsuario(Usuario userPorLogar){
		 Usuario userRecuperado=daoUser.recuperarUsuario(userPorLogar);
		if (userRecuperado!=null && userRecuperado.getPass().equals(userPorLogar.getPass())) {
			return userRecuperado;
		} else {
			return null;
		}
		
	}
	
}
