package es.upm.dit.isst.mimenu.dao;

import java.util.List;

import es.upm.dit.isst.mimenu.model.RESERVA;

public interface RESERVADAO {
	
	public RESERVA create(Long id, Long comensalId, String restEmail, Long menuId, Long platoId, String bebida);
	public RESERVA readById(Long id);
	public List<RESERVA> read();
	public List<RESERVA> readByRestEmail(String restEmail);
	public List<RESERVA> readByComensalId(Long comensalId);
	public List<RESERVA> readByMenuId(Long menuId);
	public List<RESERVA> readByPlatoId(Long platoId);
	public RESERVA updateRESERVA(RESERVA reserva);
	public RESERVA deleteRESERVA(RESERVA reserva);

}
