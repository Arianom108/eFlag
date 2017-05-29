package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import beans.Pelicula;
import beans.Usuario;
import sun.management.resources.agent;

public class PeliculaDAO {
	AgenteConexion agente;
	EntityManager em;

	public PeliculaDAO() {
		super();
		agente = AgenteConexion.getAgente();
		em = agente.getEntityManager();
	}

	public boolean votarPelicula(Pelicula pelicula, int n) {

		// Pelicula pelicula = (Pelicula)em.find(Pelicula.class, p);
		// m = (m*v+n)/(v+1);
		double nota_media_final = (pelicula.getNota_media() * pelicula.getNumero_votos() + n)
				/ (pelicula.getNumero_votos() + 1);
		pelicula.setNota_media(nota_media_final);
		pelicula.setNumero_votos(pelicula.getNumero_votos() + 1);
		try {
			em.merge(pelicula);
			return true;
		} catch (Exception e) {
			agente.rollback();
			return false;
		}
	}

	public List<Pelicula> recuperarPeliculas() {
		Query query = em.createNamedQuery("findAllFilms");
		return query.getResultList();
	}

	public boolean crearPelicula(Pelicula pelicula) {
		try {
			em.persist(pelicula);

		} catch (Exception e) {
			agente.rollback();
			return false;
		}
		return true;

	}

	public Pelicula recuperarPelicula(int id) {
		String query = "select p from Pelicula p where id_pelicula=:id";
		Query q = em.createQuery(query);
		q.setParameter("id", id);
		Pelicula p = (Pelicula) q.getSingleResult();
		return p;

	}

	public boolean eliminarPelicula(int id) {
		String query = "select p from Pelicula p where id_pelicula=:id";
		Query q = em.createQuery(query);
		q.setParameter("id", id);
		Pelicula p = (Pelicula) q.getSingleResult();
		try {
			em.remove(p);

		} catch (Exception e) {
			agente.rollback();
			return false;
		}
		return true;
	}

	public List<Pelicula> recuperarXgenero(String genero) {

		Query query = em.createNamedQuery("findByGenere");
		query.setParameter("generos", "%" + genero + "%");
		return query.getResultList();

	}

	public List<Pelicula> recuperarXnota() {
		Query query = em.createNamedQuery("findByOrder");
		return query.getResultList();

	}
	
	public boolean modificarFavorita(Pelicula p, Usuario usuario) {
		List<Pelicula> list = usuario.getFavoritos();
		try {
			for (Pelicula pelicula : list) {
				if (pelicula.equals(p)) {
					em.remove(p);
					return true;
				}
			}
			list.add(p);
			usuario.setFavoritos(list);
			em.merge(p);
			return true;
		} catch (Exception e) {
			agente.rollback();
			return false;
		}
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
