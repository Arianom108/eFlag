package beans;

public class Pelicula {
	private int id_pelicula, duracion, numero_votos;
	private String titulo, fecha, caratula, trailer, actores, directores, sinopsis;
	private double nota_media;
	String generos;
	public Pelicula(int id_pelicula, int duracion, int numero_votos, String titulo, String fecha, String caratula,
			String trailer, String actores, String directores, String sinopsis, double nota_media, String generos) {
		super();
		this.id_pelicula = id_pelicula;
		this.duracion = duracion;
		this.numero_votos = numero_votos;
		this.titulo = titulo;
		this.fecha = fecha;
		this.caratula = caratula;
		this.trailer = trailer;
		this.actores = actores;
		this.directores = directores;
		this.sinopsis = sinopsis;
		this.nota_media = nota_media;
		this.generos = generos;
	}
	
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
