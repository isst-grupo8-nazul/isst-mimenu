package es.upm.dit.isst.mimenu.dao;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.List;

import com.googlecode.objectify.Key;

import es.upm.dit.isst.mimenu.model.PLATO;

public class PLATODAOImpl implements PLATODAO {

	private static PLATODAOImpl instancia;
	
	private PLATODAOImpl() {
		
	}
	
	public static PLATODAOImpl getInstancia() {
		if (instancia == null)
			instancia= new PLATODAOImpl();
		return instancia;
	}
	
	@Override
	public PLATO create(Long id, Long menuId, String restEmail, String nombre, String tipo, String categoria) {
		PLATO plato = new PLATO(id, menuId, restEmail, nombre, tipo, categoria);
		ofy().save().entity(plato).now();
		return plato;
	}

	@Override
	public List<PLATO> readByMenu(Long menuId) {
			List<PLATO> plato = ofy().load().type(PLATO.class).filter("menuId", menuId).list();
			return plato;
	}

	@Override
	public List<PLATO> read() {
		List<PLATO> platos = ofy().load().type(PLATO.class).list();
		return platos;
	}
	
	public PLATO readById(Long id){
		PLATO plato = ofy().load().type(PLATO.class).filterKey(Key.create(PLATO.class, id)).first().now();
		return plato;
	}

	@Override
	public PLATO updatePLATO(PLATO plato) {
		ofy().save().entity(plato).now();
		return plato;
	}

	@Override
	public PLATO deletePLATO(PLATO plato) {
		ofy().delete().entity(plato).now();
		return plato;
	}
	public List<PLATO> readByREST(String restEmail){
		List<PLATO> plato = ofy().load().type(PLATO.class).filter("restEmail", restEmail).list();
		return plato;
	}

}
