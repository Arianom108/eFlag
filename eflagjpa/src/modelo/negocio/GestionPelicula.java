package modelo.negocio;

import java.util.List;

import beans.Pelicula;
import beans.Usuario;
import modelo.DAO.FavoritasDAO;
import modelo.DAO.PeliculaDAO;

public class GestionPelicula {
	PeliculaDAO daoPeli;

	public GestionPelicula() {
		daoPeli = new PeliculaDAO();
	}

	public boolean crearPelicula(Pelicula pelicula) {

		daoPeli.iniciarTransaccion();
		boolean r = daoPeli.crearPelicula(pelicula);
		daoPeli.cerrarTransaccion();

		return r;
	}

	public Pelicula recuperaPelicula(int id) {
		return daoPeli.recuperarPelicula(id);
	}

	public boolean eliminarPelicula(int id) {
		daoPeli.iniciarTransaccion();
		boolean r = daoPeli.eliminarPelicula(id);
		daoPeli.cerrarTransaccion();
		return r;
	}

	public List<Pelicula> recuperarTodas() {
		return daoPeli.recuperarPeliculas();
	}

	public List<Pelicula> recuperarXgenero(String genero) {
		return daoPeli.recuperarXgenero(genero);
	}

	public List<Pelicula> recuperarXnota() {
		return daoPeli.recuperarXnota();
	}

	public boolean votarPelicula(Pelicula p, int numVotos) {
		daoPeli.iniciarTransaccion();
		boolean r=daoPeli.votarPelicula(p, numVotos);
		daoPeli.cerrarConexion();
		return r;
	}

}
