package es.upm.dit.isst.mimenu.dao;

import java.util.List;

import es.upm.dit.isst.mimenu.model.REST;

public interface RESTDAO {
	
	public REST create(String nombre, String email, int capacidad, String password, String direccion,
			String telefono, String logo, String web, int valoracion, boolean delivery);
	public REST read(String email);
	public List<REST> read();
	public REST updateREST(REST rest);
	public REST deleteREST(REST rest);
}