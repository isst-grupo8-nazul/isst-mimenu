/**
 * 
 */
package es.upm.dit.isst.mimenu.dao;

import java.util.List;

import com.googlecode.objectify.Key;

import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.REST;

import static com.googlecode.objectify.ObjectifyService.ofy;

/**
 * @author alvaro gericke
 *
 */
public class MENUDAOImpl implements MENUDAO {

	private static MENUDAOImpl instancia;
	
	private MENUDAOImpl() {
		
	}
	
	public static MENUDAOImpl getInstancia() {
		if (instancia == null)
			instancia= new MENUDAOImpl();
		return instancia;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#create(int, java.lang.String, java.lang.String[], double, int, java.lang.String, java.lang.String, java.lang.String[], java.lang.String[])
	 */
	@Override
	public MENU create(Long id, String restEmail , String nombre, double precio, int cantidad, String fecha, String turno,
			String categorias, String[] bebidas) {
		
		MENU menu = new MENU(id, restEmail, nombre, precio, cantidad, fecha, turno, categorias, bebidas);
		ofy().save().entity(menu).now();
		
		return menu;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#read(int)
	 */
	@Override
	public MENU read(Long id) {
		
		MENU menu = ofy().load().type(MENU.class).filterKey(Key.create(MENU.class, id)).first().now();
		return menu;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#read()
	 */
	@Override
	public List<MENU> read() {
		
		List<MENU> menus = ofy().load().type(MENU.class).list();
		return menus;
	}
	
	public List<MENU> readByRest(String restEmail){
		List<MENU> menus = ofy().load().type(MENU.class).filter("restEmail", restEmail).list();
		return menus;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#readByNombre(java.lang.String)
	 */
	@Override
	public List<MENU> readByNombre(String nombre) {
		
		List<MENU> menus= ofy().load().type(MENU.class).filter("nombre", nombre).list();
		return menus;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#readByPrecio(double)
	 */
	@Override
	public List<MENU> readByPrecio(double precio) {
		
		List<MENU> menus= ofy().load().type(MENU.class).filter("precio", precio).list();
		return menus;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#readByCantidad(java.lang.String)
	 */
	@Override
	public List<MENU> readByCantidad(String cantidad) {
		
		List<MENU> menus= ofy().load().type(MENU.class).filter("cantidad", cantidad).list();
		return menus;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#readByFecha(java.lang.String)
	 */
	@Override
	public List<MENU> readByFecha(String fecha) {
		
		List<MENU> menus= ofy().load().type(MENU.class).filter("fecha", fecha).list();
		return menus;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#readByTurno(java.lang.String)
	 */
	@Override
	public List<MENU> readByTurno(String turno) {
		
		List<MENU> menus= ofy().load().type(MENU.class).filter("turno", turno).list();
		return menus;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#readByCategoria(java.lang.String)
	 */
	@Override
	public List<MENU> readByCategoria(String categoria) {
		
		List<MENU> menus= ofy().load().type(MENU.class).filter("categoria", categoria).list();
		return menus;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#updateMenu(es.upm.dit.isst.mimenu.model.MENU)
	 */
	@Override
	public MENU updateMenu(MENU menu) {
		
		ofy().save().entity(menu).now();
		return menu;
	}

	/* (non-Javadoc)
	 * @see es.upm.dit.isst.mimenu.dao.MENUDAO#deleteMenu(es.upm.dit.isst.mimenu.model.MENU)
	 */
	@Override
	public MENU deleteMenu(MENU menu) {
		
		ofy().delete().entity(menu).now();
		return menu;
	}

}
