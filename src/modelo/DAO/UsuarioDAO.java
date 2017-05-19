package modelo.DAO;

import java.sql.Connection;

import beans.Usuario;

public class UsuarioDAO {
	Connection conexion;

	public UsuarioDAO() {
		super();
		this.conexion = AgenteConexion.getAgente().conexion;
	}
	
	public boolean crearUsuario(Usuario usuario){
		return false;
	}
	
	public Usuario recuperarUsuario(Usuario usuario){
		return null;
	}
	
}
