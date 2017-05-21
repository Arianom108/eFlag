package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import beans.Pelicula;

public class PeliculaDAO {
	Connection conexion;

	public PeliculaDAO() {
		super();
		this.conexion = AgenteConexion.getAgente().conexion;
	}
	
	public List<Pelicula> recuperarPeliculas(){
		return null;
	}
	
	public boolean crearPelicula(Pelicula pelicula){
		String sql = "INSERT INTO peliculas VALUES (null,?,?,?,?,?,null,null,?,?,?,?)";
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			sentencia.setString(1, pelicula.getTitulo());
			sentencia.setString(2, pelicula.getDirectores());
			sentencia.setString(3, pelicula.getActores());
			sentencia.setInt(4, pelicula.getDuracion());
			sentencia.setString(5, pelicula.getFecha());
			sentencia.setString(6, pelicula.getCaratula());
			sentencia.setString(7, pelicula.getTrailer());
			sentencia.setString(8, pelicula.getGeneros());
			sentencia.setString(9, pelicula.getSinopsis());
			sentencia.executeUpdate();
			sentencia.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean recuperarPelicula(int id){
		String sql = "SELECT * FROM peliculas WHERE id=?";
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			sentencia.setInt(1, id);
			ResultSet rs = sentencia.executeQuery();
			if(rs.next()){
				Pelicula pelicula = new Pelicula(rs.getInt("id_pelicula"), rs.getInt("duracion"), rs.getInt("numero_votos"), rs.getString("titulo"), rs.getString("fecha"), rs.getString("caratula"), rs.getString("trailer"), rs.getString("actores"), rs.getString("directores"), rs.getString("sinopsis"), rs.getDouble("nota_media"), rs.getString("generos"));
				if(pelicula!=null)
					return true;
			}
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean eliminarPeliculas(int id){
		return false;
	}
	
}
