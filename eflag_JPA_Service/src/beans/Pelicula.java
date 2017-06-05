package beans;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
@Table
@Entity
@NamedQueries({
	@NamedQuery(query = "Select p from Pelicula p", name="findAllFilms"),
	@NamedQuery(query = "SELECT p FROM Pelicula p WHERE p.generos like :generos", name = "findByGenere"),
	@NamedQuery(query = "SELECT p FROM Pelicula p order By p.nota_media desc" , name = "findByOrder")
//	@NamedQuery(query ="UPDATE Pelicula p SET p.numero_votos=p.numeros_votos+1, p.nota_media=(p.nota_media*p.numero_votos+p.nota_media)/(p.numero_votos+1) WHERE p.id_pelicula=?3" , name = "fidByOrder")
}) 
public class Pelicula {
	@Id
	@GeneratedValue
	private Integer id_pelicula;
	private int duracion, numero_votos;
	private String titulo, fecha, caratula, trailer, actores, directores, sinopsis;
	private double nota_media;
	private String generos;
	
	public Pelicula(){}


	public String getSinopsis() {
		return sinopsis;
	}

	public void setSinopsis(String sinopsis) {
		this.sinopsis = sinopsis;
	}


	public int getId_pelicula() {
		return id_pelicula;
	}

	public void setId_pelicula(int id_pelicula) {
		this.id_pelicula = id_pelicula;
	}

	public int getDuracion() {
		return duracion;
	}

	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}

	public int getNumero_votos() {
		return numero_votos;
	}

	public void setNumero_votos(int numero_votos) {
		this.numero_votos = numero_votos;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getCaratula() {
		return caratula;
	}

	public void setCaratula(String caratula) {
		this.caratula = caratula;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public String getActores() {
		return actores;
	}

	public void setActores(String actores) {
		this.actores = actores;
	}

	public String getDirectores() {
		return directores;
	}

	public void setDirectores(String directores) {
		this.directores = directores;
	}

	public double getNota_media() {
		return nota_media;
	}

	public void setNota_media(double nota_media) {
		this.nota_media = nota_media;
	}

	public String getGeneros() {
		return generos;
	}

	public void setGeneros(String generos) {
		this.generos = generos;
	};
	
	
}
