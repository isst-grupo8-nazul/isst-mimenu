package es.upm.dit.isst.mimenu.dao;

import java.util.List;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.REST;

public interface MENUDAO {
	
	public MENU create (Long id, REST rest, String nombre, String[][] platos, double precio, int cantidad, String fecha, String turno, String[] categorias, String[] bebidas);
	
	public MENU read(Long id);
	public List<MENU> read();
	public List<MENU> readByRest(REST rest);
	public List<MENU> readByNombre(String nombre);
	public List<MENU> readByPrecio(double precio);
	public List<MENU> readByCantidad(String cantidad);
	public List<MENU> readByFecha(String fecha);
	public List<MENU> readByTurno(String turno);
	public List<MENU> readByCategoria(String categoria);
	
	public MENU updateMenu(MENU menu);
	
	public MENU deleteMenu(MENU menu);
}



