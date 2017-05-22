package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import beans.Pelicula;
import beans.Usuario;

public class PeliculaDAO {
	Connection conexion;

	public PeliculaDAO() {
		super();
		this.conexion = AgenteConexion.getAgente().conexion;
	}
	
	public List<Pelicula> recuperarPeliculas(){
		String sql = "SELECT * FROM peliculas";
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			ResultSet rs =sentencia.executeQuery();
			List<Pelicula> listaPelis = new ArrayList<Pelicula>();
			while(rs.next()){
			   	   int id        = rs.getInt("id_pelicula");
				   int dura       = rs.getInt("duracion");
				   int votos	  = rs.getInt("votos");
				double n_media    = rs.getDouble("nota_media");
				String f_estreno  = rs.getString("fecha_estreno");
				String titulo     = rs.getString("titulo");
				String directores = rs.getString("directores");
				String actores    = rs.getString("actores");
				String generos    = rs.getString("generos");
				String caratula   = rs.getString("caratula");
				String trailer    = rs.getString("trailer");
				String sinopsis   = rs.getString("sinopsis");
				Pelicula peli = new Pelicula( id, dura, votos, titulo, f_estreno, caratula, trailer, actores, directores, sinopsis, n_media, generos);
				listaPelis.add(peli);
			}	
			return listaPelis;
	    	}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();	
		    }
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
	
	public Pelicula recuperarPelicula(int id){
		String sql = "SELECT * FROM peliculas WHERE id=?";
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			sentencia.setInt(1, id);
			ResultSet rs = sentencia.executeQuery();
			if(rs.next()){
				return new Pelicula(rs.getInt("id_pelicula"), rs.getInt("duracion"), rs.getInt("numero_votos"), rs.getString("titulo"), rs.getString("fecha"), rs.getString("caratula"), rs.getString("trailer"), rs.getString("actores"), rs.getString("directores"), rs.getString("sinopsis"), rs.getDouble("nota_media"), rs.getString("generos"));
			}
			else
				return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean eliminarPelicula(int id){
		String sql = "DELETE FROM peliculas WHERE id=?";
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			sentencia.setInt(1, id);
			if(sentencia.executeUpdate()>0){
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
	
}
