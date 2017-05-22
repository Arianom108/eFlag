package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;



import beans.Usuario;
import beans.Pelicula;

public class FavoritasDAO {
	Connection conexion;

	public FavoritasDAO() {
		super();
		this.conexion = AgenteConexion.getAgente().conexion;
	}
	
	
	public boolean modificarFavorita(int id, Usuario usuario){
		String sql = "SELECT FROM favoritas where id_pelicula=? and id_usuario=?";
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			sentencia.setInt(1, id);
			sentencia.setInt(2, usuario.getId_usuario());
			ResultSet rs=sentencia.executeQuery();
			if(rs.first()){
				rs.deleteRow();
				sentencia.close();
				return true;
			}else{
				Statement agregar= conexion.createStatement();
				agregar.executeQuery("INSERT INTO favoritas VALUES('"+id+"','"+usuario.getId_usuario()+"')");
				return true;
			}					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return false;
	}
	
	public List<Pelicula> recuperarFavoritas(){
		List<Pelicula> peliculas = new List<Pelicula>();
		return null;
	}
}
