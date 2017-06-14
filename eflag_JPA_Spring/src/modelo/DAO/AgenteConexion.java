package modelo.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class AgenteConexion {

//	protected static AgenteConexion mInstancia = null;
//	protected Connection conexion;
//
//	protected AgenteConexion(String nombreDB) {
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			conexion = DriverManager.getConnection("jdbc:mysql://localhost/" + nombreDB, "root", "root");
//		} catch (ClassNotFoundException | SQLException e) {
//			System.out.println("Error de conexion");
//		}
//	}
//
//	public static AgenteConexion getAgente() {
//		if (mInstancia == null) {
//			mInstancia = new AgenteConexion("eflag");
//		}
//		return mInstancia;
//	}
	
	private static AgenteConexion instancia;
	private EntityManagerFactory emf;
	private EntityManager em;
	private EntityTransaction  tx;
	
	private AgenteConexion(){
		emf=Persistence.createEntityManagerFactory("eflagjpa");
		em= emf.createEntityManager();
	}
	
	public EntityManager getEntityManager(){
		return getAgente().em;
		}
	
	public static AgenteConexion getAgente(){
		if(instancia==null){
			instancia = new AgenteConexion();
		}
		return instancia;

	}

	public  void iniciarTransaccion(){
		tx= em.getTransaction();
		tx.begin();
	}

	public  void cerrarTransaccion(){
		tx.commit();
	}
	
	public  void rollback(){
		tx.rollback();
	}
	

}
