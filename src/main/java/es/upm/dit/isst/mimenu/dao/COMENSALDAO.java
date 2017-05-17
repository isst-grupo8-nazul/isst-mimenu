package es.upm.dit.isst.mimenu.dao;

import java.util.List;

import es.upm.dit.isst.mimenu.model.COMENSAL;

public interface COMENSALDAO {
	
	public COMENSAL create(Long id, String email, String nombre, String password, String direccion, String telefono, int valoracion);
	public COMENSAL read(String email);
	public COMENSAL readById(Long id);
	public List<COMENSAL> read();
	public COMENSAL updateCOMENSAL(COMENSAL comensal);
	public COMENSAL deleteCOMENSAL(COMENSAL comensal);

}
