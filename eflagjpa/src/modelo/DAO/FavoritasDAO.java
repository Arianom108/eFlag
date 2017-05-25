package modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Usuario;
import beans.Pelicula;

public class FavoritasDAO {
	Connection conexion;
	PeliculaDAO daoPeli;

	public FavoritasDAO() {
		super();
		this.conexion = AgenteConexion.getAgente().conexion;
		daoPeli = new PeliculaDAO();
	}

	public boolean modificarFavorita(int id, Usuario usuario) {
		String sqlSelect = "SELECT * FROM favoritas where id_pelicula=? and id_usuario=?";
		String sqlUpdate = "INSERT INTO favoritas VALUES(?,?)";
		String sqlDelete = "DELETE FROM favoritas where id_pelicula = ?";
		int iduser = usuario.getId_usuario();
		int idint = id;
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sqlSelect);
			sentencia.setInt(1, idint);
			sentencia.setInt(2, iduser);
			ResultSet rs = sentencia.executeQuery();
			if (rs.first()) {
				sentencia = conexion.prepareStatement(sqlDelete);
				sentencia.setInt(1, idint);
				sentencia.executeUpdate();
				sentencia.close();
				return true;
			} else {
				PreparedStatement agregar = conexion.prepareStatement(sqlUpdate);
				agregar.setInt(1, idint);
				agregar.setInt(2, iduser);
				agregar.executeUpdate();
				agregar.close();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public List<Pelicula> recuperarFavoritas(Usuario user) {
		String sql = "SELECT * FROM favoritas WHERE id_usuario=" + user.getId_usuario();
		try {
			PreparedStatement sentencia = conexion.prepareStatement(sql);
			ResultSet rs = sentencia.executeQuery();
			List<Pelicula> listaFavoritas = new ArrayList<Pelicula>();
			while (rs.next()) {
				int id = rs.getInt("id_pelicula");
				listaFavoritas.add(daoPeli.recuperarPelicula(id));
			}
			return listaFavoritas;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
