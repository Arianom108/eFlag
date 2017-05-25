package modelo.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AgenteConexion {

	protected static AgenteConexion mInstancia = null;
	protected Connection conexion;

	protected AgenteConexion(String nombreDB) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection("jdbc:mysql://localhost/" + nombreDB, "root", "root");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Error de conexion");
		}
	}

	public static AgenteConexion getAgente() {
		if (mInstancia == null) {
			mInstancia = new AgenteConexion("eflag");
		}
		return mInstancia;
	}

}
