package es.upm.dit.isst.mimenu.dao;

import java.util.List;

import es.upm.dit.isst.mimenu.model.PLATO;

public interface PLATODAO {
	
	public PLATO create(Long id, Long menuId, String restEmail, String nombre, String tipo, String categoria);
	public PLATO readById(Long id);
	public List<PLATO> readByMenu(Long menuId);
	public List<PLATO> readByREST(String restEmail);
	public List<PLATO> read();
	public PLATO updatePLATO(PLATO plato);
	public PLATO deletePLATO(PLATO plato);

}
