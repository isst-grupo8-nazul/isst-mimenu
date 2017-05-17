package es.upm.dit.isst.mimenu.dao;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.List;

import com.googlecode.objectify.Key;

import es.upm.dit.isst.mimenu.model.COMENSAL;


public class COMENSALDAOImpl implements COMENSALDAO {
	
	private static COMENSALDAOImpl instancia;
	
	private COMENSALDAOImpl() {
		
	}
	
	public static COMENSALDAOImpl getInstancia() {
		if (instancia == null)
			instancia= new COMENSALDAOImpl();
		return instancia;
	}
	@Override
	public COMENSAL create(Long id, String email, String nombre, String password, String direccion, String telefono,
			int valoracion) {
		COMENSAL comensal = new COMENSAL(id,email,nombre,password,direccion,telefono,valoracion);
		ofy().save().entity(comensal).now();
		return comensal;
	}

	@Override
	public COMENSAL read(String email) {
		
		COMENSAL comensal = ofy().load().type(COMENSAL.class).filter("email", email).first().now();
		return comensal;
		
		
	}
	
	@Override
	public COMENSAL readById(Long id) {
		COMENSAL comensal = ofy().load().type(COMENSAL.class).filterKey(Key.create(COMENSAL.class, id)).first().now();
		return comensal;
	}

	@Override
	public List<COMENSAL> read() {
		List<COMENSAL> rest = ofy().load().type(COMENSAL.class).list();
		return rest;
	}

	@Override
	public COMENSAL updateCOMENSAL(COMENSAL comensal) {
		ofy().save().entity(comensal).now();
		return comensal;
	}

	@Override
	public COMENSAL deleteCOMENSAL(COMENSAL comensal) {
		ofy().delete().entity(comensal).now();
		return comensal;
	}

}
