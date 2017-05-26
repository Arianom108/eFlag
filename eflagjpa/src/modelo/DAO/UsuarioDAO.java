package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;

import beans.Pelicula;
import beans.Usuario;

public class UsuarioDAO {
	AgenteConexion agente;
	EntityManager em;

	public UsuarioDAO() {
		super();
		agente = AgenteConexion.getAgente();
		em = agente.getEntityManager();
	}

	public boolean crearUsuario(Usuario usuario) {
		try {
			em.persist(usuario);

		} catch (Exception e) {
			agente.rollback();
			return false;
		}
		return true;
	}

	public Usuario recuperarUsuario(Usuario usuario) {
		Usuario u = em.find(Usuario.class, usuario.getEmail());
		//em.refresh(u);
		return u;
	}

	

	public List<Pelicula> recuperarFavoritas(Usuario usuario) {
		Usuario u = em.find(Usuario.class, usuario);
		return u.getFavoritos();

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
