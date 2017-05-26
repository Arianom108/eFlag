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
		return daoUsuario.recuperarUsuario().getFavoritas();
	}
	public boolean modificarFavoritas(Pelicula p, Usuario user){
		return daoFavoritas.modificarFavorita(p, user);
	}
	

}
