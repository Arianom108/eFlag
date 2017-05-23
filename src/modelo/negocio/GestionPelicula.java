package modelo.negocio;

import java.util.List;


import beans.Pelicula;
import beans.Usuario;
import modelo.DAO.FavoritasDAO;
import modelo.DAO.PeliculaDAO;

public class GestionPelicula {
	PeliculaDAO daoPeli;
	
	public GestionPelicula(){
		daoPeli = new PeliculaDAO();
	}
	public boolean crearPelicula(Pelicula pelicula){
				return daoPeli.crearPelicula(pelicula);
	}
	public Pelicula recuperaPelicula(int id){
		return daoPeli.recuperarPelicula(id);
	}
	
	public boolean eliminarPelicula(int id){
		return daoPeli.eliminarPelicula(id);
	}
	public List<Pelicula> recuperarTodas(){
		return null;
	}
		
	public List<Pelicula> recuperarXgenero(String genero){
		return daoPeli.recuperarXgenero();
	}
	
	public List<Pelicula> recuperarXnota(){
		return daoPeli.recuperarXnota();
	}
	
	
	

}
