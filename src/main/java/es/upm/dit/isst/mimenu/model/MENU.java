/**
 * 
 */
package es.upm.dit.isst.mimenu.model;

import java.io.Serializable;
import java.util.Arrays;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.*;


/**
 * @author alvaro gericke
 *
 */
@Entity
public class MENU implements Serializable {

	private static final long serialVersionUID = 01L;
	
	@Id
	private Long id;
	
	@Index
	private String restEmail;
	
	@Index
	private String nombre;
	
	@Index
	private double precio;
	@Index
	private int cantidad;
	@Index
	private String fecha;
	@Index
	private String turno;
	@Index
	private String categorias;
	@Index
	private String[] bebidas;
	

	/**
	 * @param id
	 * @param nombre
	 * @param platos
	 * @param precio
	 * @param cantidad
	 * @param fecha
	 * @param turno
	 * @param categorias
	 * @param bebidas
	 */

	public MENU(Long id, String restEmail, String nombre, double precio, int cantidad, String fecha,
			String turno, String categorias, String[] bebidas) {
		super();
		this.id = id;
		this.restEmail = restEmail;
		this.nombre = nombre;
		this.precio = precio;
		this.cantidad = cantidad;
		this.fecha = fecha;
		this.turno = turno;
		this.categorias = categorias;
		this.bebidas = bebidas;
	}

	private MENU() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRestEmail() {
		return restEmail;
	}

	public void setRestEmail(String restEmail) {
		this.restEmail = restEmail;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getTurno() {
		return turno;
	}

	public void setTurno(String turno) {
		this.turno = turno;
	}

	public String getCategorias() {
		return categorias;
	}

	public void setCategorias(String categorias) {
		this.categorias = categorias;
	}

	public String[] getBebidas() {
		return bebidas;
	}

	public void setBebidas(String[] bebidas) {
		this.bebidas = bebidas;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
