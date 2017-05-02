package es.upm.dit.isst.mimenu.model;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class REST implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private String email;
	
	@Index
	private String nombre;
	
	@Index
	private int capacidad;
	
	private String password;
	@Index
	private String direccion;
	@Index
	private String telefono;
	
	private String logo;
	
	private String web;
	@Index
	private int valoracion;
	@Index
	private boolean delivery;
	
	public REST(){}
	
	
	public REST(String nombre, String email, int capacidad, String password, String direccion,
			String telefono, String logo, String web, int valoracion, boolean delivery) {
		super();
		this.nombre = nombre;
		this.email = email;
		this.capacidad = capacidad;
		this.password = password;
		this.direccion = direccion;
		this.telefono = telefono;
		this.logo = logo;
		this.web = web;
		this.valoracion = valoracion;
		this.delivery = delivery;
	}



	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the capacidad
	 */
	public int getCapacidad() {
		return capacidad;
	}
	/**
	 * @param capacidad the capacidad to set
	 */
	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the direccion
	 */
	public String getDireccion() {
		return direccion;
	}
	/**
	 * @param direccion the direccion to set
	 */
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	/**
	 * @return the telefono
	 */
	public String getTelefono() {
		return telefono;
	}
	/**
	 * @param telefono the telefono to set
	 */
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	/**
	 * @return the logo
	 */
	public String getLogo() {
		return logo;
	}
	/**
	 * @param logo the logo to set
	 */
	public void setLogo(String logo) {
		this.logo = logo;
	}
	/**
	 * @return the web
	 */
	public String getWeb() {
		return web;
	}
	/**
	 * @param web the web to set
	 */
	public void setWeb(String web) {
		this.web = web;
	}
	/**
	 * @return the valoracion
	 */
	public int getValoracion() {
		return valoracion;
	}
	/**
	 * @param valoracion the valoracion to set
	 */
	public void setValoracion(int valoracion) {
		this.valoracion = valoracion;
	}
	/**
	 * @return the delivery
	 */
	public boolean isDelivery() {
		return delivery;
	}
	/**
	 * @param delivery the delivery to set
	 */
	public void setDelivery(boolean delivery) {
		this.delivery = delivery;
	}
	
	

}
	