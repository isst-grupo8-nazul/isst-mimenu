package es.upm.dit.isst.mimenu.model;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class RESERVA implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Long id;
	
	@Index
	private Long comensalId;
	
	@Index
	private String restEmail;
	
	@Index
	private Long menuId;

	@Index
	private Long platoId;
	
	@Index
	private String bebida;
	
	public RESERVA() {	}

	public RESERVA(Long id, Long comensalId, String restEmail, Long menuId, Long platoId, String bebida) {
		super();
		this.id = id;
		this.comensalId = comensalId;
		this.restEmail = restEmail;
		this.menuId = menuId;
		this.platoId = platoId;
		this.bebida = bebida;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getComensalId() {
		return comensalId;
	}

	public void setComensalId(Long comensalId) {
		this.comensalId = comensalId;
	}

	public String getRestEmail() {
		return restEmail;
	}

	public void setRestEmail(String restEmail) {
		this.restEmail = restEmail;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Long getPlatoId() {
		return platoId;
	}

	public void setPlatoId(Long platoId) {
		this.platoId = platoId;
	}

	public String getBebida() {
		return bebida;
	}

	public void setBebida(String bebida) {
		this.bebida = bebida;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
