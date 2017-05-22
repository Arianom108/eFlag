package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Usuario;

public class UsuarioDAO {
	Connection conexion;

	public UsuarioDAO() {
		super();
		this.conexion = AgenteConexion.getAgente().conexion;
	}
	
	public boolean crearUsuario(Usuario usuario){
		String sql = "INSERT INTO usuarios VALUES (null, ?,?,?)";
		//String sql = "INSERT INTO peliculas VALUES (null,?,?,?,null,?,?,?,?,?,null,?)";
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			sentencia.setString(1, usuario.getNombre());
			sentencia.setString(2, usuario.getPass());
			sentencia.setString(3, usuario.getEmail());
			sentencia.executeUpdate();
			sentencia.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		
		return false;
	}
	
	public Usuario recuperarUsuario(Usuario usuario){
		String sql = "SELECT * FROM usuarios where email=?";
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			sentencia.setString(1, usuario.getEmail());
			ResultSet rs = sentencia.executeQuery();
			if(rs.next()){
				return new Usuario(rs.getInt("id_usuario"), rs.getString("nombre"),  rs.getString("email"),  rs.getString("password") );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
