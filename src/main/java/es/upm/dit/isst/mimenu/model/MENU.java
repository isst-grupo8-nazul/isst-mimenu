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
	private REST rest;
	
	@Index
	private String nombre;
	@Index
	private String[][] platos;
	@Index
	private double precio;
	@Index
	private int cantidad;
	@Index
	private String fecha;
	@Index
	private String turno;
	@Index
	private String[] categorias;
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

	public MENU(Long id, REST rest, String nombre, String[][] platos, double precio, int cantidad, String fecha,
			String turno, String[] categorias, String[] bebidas) {
		super();
		this.id = id;
		this.rest = rest;
		this.nombre = nombre;
		this.platos = platos;
		this.precio = precio;
		this.cantidad = cantidad;
		this.fecha = fecha;
		this.turno = turno;
		this.categorias = categorias;
		this.bebidas = bebidas;
	}

	private MENU() {
	}
	
	public REST getRest() {
		return rest;
	}

	public void setRest(REST rest) {
		this.rest = rest;
	}

	/**
	 * 
	 */
	


	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}


	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
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
	 * @return the platos
	 */
	public String[][] getPlatos() {
		return platos;
	}


	/**
	 * @param platos the platos to set
	 */
	public void setPlatos(String[][] platos) {
		this.platos = platos;
	}


	/**
	 * @return the precio
	 */
	public double getPrecio() {
		return precio;
	}


	/**
	 * @param precio the precio to set
	 */
	public void setPrecio(double precio) {
		this.precio = precio;
	}


	/**
	 * @return the cantidad
	 */
	public int getCantidad() {
		return cantidad;
	}


	/**
	 * @param cantidad the cantidad to set
	 */
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}


	/**
	 * @return the fecha
	 */
	public String getFecha() {
		return fecha;
	}


	/**
	 * @param fecha the fecha to set
	 */
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}


	/**
	 * @return the turno
	 */
	public String getTurno() {
		return turno;
	}


	/**
	 * @param turno the turno to set
	 */
	public void setTurno(String turno) {
		this.turno = turno;
	}


	/**
	 * @return the categorias
	 */
	public String[] getCategorias() {
		return categorias;
	}


	/**
	 * @param categorias the categorias to set
	 */
	public void setCategorias(String[] categorias) {
		this.categorias = categorias;
	}


	/**
	 * @return the bebidas
	 */
	public String[] getBebidas() {
		return bebidas;
	}


	/**
	 * @param bebidas the bebidas to set
	 */
	public void setBebidas(String[] bebidas) {
		this.bebidas = bebidas;
	}

	





	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
