package modelo.negocio;

import java.util.List;

import beans.Pelicula;
import beans.Usuario;
import modelo.DAO.FavoritasDAO;

public class GestionFavoritas {
	FavoritasDAO daoFavoritas;
	public GestionFavoritas(){
		daoFavoritas = new FavoritasDAO();
	}
	public List<Pelicula> recuperarFavoritas(Usuario usuario){
		return daoFavoritas.recuperarFavoritas(usuario);
	}
	public boolean modificarFavoritas(int id, Usuario user){
		return daoFavoritas.modificarFavorita(id, user);
	}
	

}
