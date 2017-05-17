package es.upm.dit.isst.mimenu.model;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

public class COMENSAL implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	private Long id;
	
	private String email;
	
	@Index
	private String nombre;
	
	private String password;
	@Index
	private String direccion;
	@Index
	private String telefono;
	
	@Index
	private int valoracion;
	
	
	
	public COMENSAL() {	}



	public COMENSAL(Long id, String email, String nombre, String password, String direccion, String telefono, int valoracion) {
		super();
		this.id = id;
		this.email = email;
		this.nombre = nombre;
		this.password = password;
		this.direccion = direccion;
		this.telefono = telefono;

		this.valoracion = valoracion;
	}



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getNombre() {
		return nombre;
	}



	public void setNombre(String nombre) {
		this.nombre = nombre;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getDireccion() {
		return direccion;
	}



	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}



	public String getTelefono() {
		return telefono;
	}



	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}










	public int getValoracion() {
		return valoracion;
	}



	public void setValoracion(int valoracion) {
		this.valoracion = valoracion;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
}
