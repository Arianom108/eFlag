package modelo.negocio;

import java.util.List;


import beans.Pelicula;
import beans.Usuario;
import modelo.DAO.FavoritasDAO;
import modelo.DAO.PeliculaDAO;

public class GestionPelicula {
	PeliculaDAO daoPeli;
	FavoritasDAO daoFavoritas;
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
	
	public List<Pelicula> recuperarFavoritas(Usuario usuario){
		return null;
	}
	
	public List<Pelicula> recuperarXGenero(String genero){
		return null;
	}
	
	public List<Pelicula> recuperarXNota(){
		return null;
	}
	
	public boolean modificarFavoritas(int id, Usuario user){
		return daoFavoritas.modificarFavorita(id, user);
	}

}
