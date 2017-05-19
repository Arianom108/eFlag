package modelo.DAO;

import java.sql.Connection;
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
		return false;
	}
	
	public boolean recuperarPelicula(int id){
		return false;
	}
	
	public boolean eliminarPeliculas(int id){
		return false;
	}
	
}
