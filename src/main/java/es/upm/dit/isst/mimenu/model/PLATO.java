package es.upm.dit.isst.mimenu.model;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class PLATO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	private Long id;
	
	@Index
	private Long menuId;
	
	@Index
	private String restEmail;
	
	private String nombre;
	private String tipo;
	private String categoria;
	
	public PLATO(){}
	
	
	public PLATO(Long id, Long menuId, String restEmail, String nombre, String tipo, String categoria) {
		super();
		this.id = id;
		this.menuId = menuId;
		this.restEmail = restEmail;
		this.nombre = nombre;
		this.tipo = tipo;
		this.categoria = categoria;
	}


	public Long getMenuId() {
		return menuId;
	}


	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}


	public String getRestEmail() {
		return restEmail;
	}


	public void setRestEmail(String restEmail) {
		this.restEmail = restEmail;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
	
}
