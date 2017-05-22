package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import beans.Usuario;
import beans.Pelicula;

public class FavoritoDAO {
	Connection conexion;

	public FavoritoDAO() {
		super();
		this.conexion = AgenteConexion.getAgente().conexion;
	}
	
	public boolean modificarFavorito(int id, Usuario usuario){
		String sql = "DELETE FROM favoritas where id_pelicula=? and id_usuario=?";
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			sentencia.setInt(1, id);
			sentencia.setInt(2, usuario.getId_usuario());
			sentencia.executeUpdate();
			sentencia.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public List<Pelicula> recuperarFavoritos(){
		List<Pelicula> peliculas = new List<Pelicula>();
		return null;
	}
}
