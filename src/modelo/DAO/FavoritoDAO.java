package modelo.DAO;

import java.sql.Connection;
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
		return false;
	}
	
	public List <Pelicula> recuperarFavoritos(){
		return null;
	}
}
