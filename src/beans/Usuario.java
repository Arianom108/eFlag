package beans;

public class Usuario {
	private int id_usuario;
	private String nombre, email, pass;
	
	public Usuario(int id_usuario, String nombre, String email, String pass) {
		super();
		this.id_usuario = id_usuario;
		this.nombre = nombre;
		this.email = email;
		this.pass = pass;
	}
	public Usuario(){}
	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
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
	};	
	
}
