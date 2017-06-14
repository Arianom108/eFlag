package service;

import javax.websocket.server.PathParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import beans.Pelicula;

import java.util.List;
import modelo.negocio.GestionPelicula;

@Path("/")
public class Service {

	private GestionPelicula gestorPelicula;

	public Service() {
			gestorPelicula = new GestionPelicula();
		}

	public GestionPelicula getGestorPelicula() {
		return gestorPelicula;
	}

	public void setGestorPelicula(GestionPelicula gestorPelicula) {
		this.gestorPelicula = gestorPelicula;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Pelicula> getPeliculas() {
		return gestorPelicula.recuperarTodas();
	}
	@Path("/{genero}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Pelicula> getPeliculasGenero(@PathParam("genero") String genero) {
		return gestorPelicula.recuperarXgenero(genero);
	}
}
