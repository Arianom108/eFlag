package beans;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
@Entity
public class Usuario {
	
	@Id
	private String email;
	private String nombre;
	private String pass;

	@ManyToMany(fetch = FetchType.EAGER)
	List<Pelicula> favoritos;

	public Usuario() {
	}

	public List<Pelicula> getFavoritos() {
		return favoritos;
	}

	public void setFavoritos(List<Pelicula> favoritos) {
		this.favoritos = favoritos;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

}
