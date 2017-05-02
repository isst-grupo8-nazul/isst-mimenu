package es.upm.dit.isst.mimenu.dao;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.List;

import com.googlecode.objectify.Key;

import es.upm.dit.isst.mimenu.model.REST;

public class RESTDAOImpl implements RESTDAO {
	
	private static RESTDAOImpl instancia;
	
	private RESTDAOImpl() {
		
	}
	
	public static RESTDAOImpl getInstancia() {
		if (instancia == null)
			instancia= new RESTDAOImpl();
		return instancia;
	}

	@Override
	public REST create(String nombre, String email, int capacidad, String password, String direccion,
			String telefono, String logo, String web, int valoracion, boolean delivery) {
		REST rest = new REST(nombre, email, capacidad, password, direccion,
				telefono, logo, web, valoracion, delivery);
		ofy().save().entity(rest).now();
		
		return rest;
	}

	@Override
	public REST read(String email) {
		REST rest = ofy().load().type(REST.class).filterKey(Key.create(REST.class, email)).first().now();
		return rest;
	}

	@Override
	public List<REST> read() {
		List<REST> rest = ofy().load().type(REST.class).list();
		return rest;
	}

	@Override
	public REST updateREST(REST rest) {
		ofy().save().entity(rest).now();
		return rest;
	}

	@Override
	public REST deleteREST(REST rest) {
		ofy().delete().entity(rest).now();
		return rest;
	}

}
