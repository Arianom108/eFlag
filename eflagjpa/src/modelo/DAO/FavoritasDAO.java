package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import beans.Usuario;
import beans.Pelicula;

public class FavoritasDAO {
	AgenteConexion agente;
	EntityManager em;

	public FavoritasDAO() {
		super();
		agente = AgenteConexion.getAgente();
		em = agente.getEntityManager();
	}

	public boolean modificarFavorita(Pelicula p, Usuario usuario) {
		List<Pelicula> list = recuperarFavoritas(usuario);
		try {
			for (Pelicula pelicula : list) {
				if (pelicula.equals(p)) {
					em.remove(p);
					return true;
				}
			}
			em.merge(p);
			return true;
		} catch (Exception e) {
			agente.rollback();
			return false;
		}
	}

	public List<Pelicula> recuperarFavoritas(Usuario user) {
		Usuario usuario = em.find(Usuario.class, user.getEmail());
		return usuario.getFavoritos();
	}

	public void iniciarTransaccion() {
		agente.iniciarTransaccion();
	}

	public void cerrarTransaccion() {
		agente.cerrarTransaccion();
	}

	public void cerrarConexion() {
		em.close();

	}
}
