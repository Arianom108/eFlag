package test;

import beans.Pelicula;
import beans.Usuario;
import modelo.DAO.PeliculaDAO;
import modelo.DAO.UsuarioDAO;
import modelo.negocio.GestionPelicula;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		PeliculaDAO peliculaDAO =new PeliculaDAO();
		Pelicula pelicula = new Pelicula();
		Usuario usuario = new Usuario(-1, "Fran2", "pass2", "fran2@fran2.es");
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		pelicula.setTitulo("It");
		pelicula.setDuracion(120);
		pelicula.setFecha("2017-05-18");
		pelicula.setCaratula("urlCaratula");
		pelicula.setTrailer("urlTrailer");
		pelicula.setActores("John Doe");
		pelicula.setDirectores("John Es");
		pelicula.setSinopsis("Esta pelicula mola un monton");
		pelicula.setGeneros("Comedia");
		if( peliculaDAO.crearPelicula(pelicula) == true )
			System.out.println("Correcto");
		else
			System.out.println("Incorrecto");
		if( usuarioDAO.crearUsuario(usuario)==true)
			System.out.println("Usuario creado correcto");
		else
			System.out.println("Usuario repetido");
		if(usuarioDAO.recuperarUsuario(usuario) != null){
			System.out.println("BIEN");
		}else
			System.out.println("MAL");
	}

}
