package es.upm.dit.isst.mimenu.dao;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.List;

import com.googlecode.objectify.Key;

import es.upm.dit.isst.mimenu.model.RESERVA;

public class RESERVADAOImpl implements RESERVADAO {

	private static RESERVADAOImpl instancia;
	
	private RESERVADAOImpl() {
		
	}
	
	public static RESERVADAOImpl getInstancia() {
		if (instancia == null)
			instancia= new RESERVADAOImpl();
		return instancia;
	}
	
	@Override
	public RESERVA create(Long id, Long comensalId, String restEmail, Long menuId, Long platoId, String bebida) {
		RESERVA reserva = new RESERVA(id, comensalId, restEmail, menuId, platoId, bebida);
		ofy().save().entity(reserva).now();
		return reserva;
	}

	@Override
	public RESERVA readById(Long id) {
		RESERVA reserva = ofy().load().type(RESERVA.class).filterKey(Key.create(RESERVA.class, id)).first().now();
		return reserva;
	}

	@Override
	public List<RESERVA> read() {
		List<RESERVA> reserva = ofy().load().type(RESERVA.class).list();
		return reserva;
	}

	@Override
	public List<RESERVA> readByRestEmail(String restEmail) {
		List<RESERVA> reservas = ofy().load().type(RESERVA.class).filter("restEmail", restEmail).list();
		return reservas;
	}

	@Override
	public List<RESERVA> readByComensalId(Long comensalId) {
		List<RESERVA> reservas = ofy().load().type(RESERVA.class).filter("comensalId", comensalId).list();
		return reservas;
	}

	@Override
	public List<RESERVA> readByMenuId(Long menuId) {
		List<RESERVA> reservas = ofy().load().type(RESERVA.class).filter("menuId", menuId).list();
		return reservas;
	}

	@Override
	public List<RESERVA> readByPlatoId(Long platoId) {
		List<RESERVA> reservas = ofy().load().type(RESERVA.class).filter("platoId", platoId).list();
		return reservas;
	}

	@Override
	public RESERVA updateRESERVA(RESERVA reserva) {
		ofy().save().entity(reserva).now();
		return reserva;
	}

	@Override
	public RESERVA deleteRESERVA(RESERVA reserva) {
		ofy().delete().entity(reserva).now();
		return reserva;
	}

}
