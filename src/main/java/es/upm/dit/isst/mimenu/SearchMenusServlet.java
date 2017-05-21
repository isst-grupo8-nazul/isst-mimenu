package es.upm.dit.isst.mimenu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

import es.upm.dit.isst.mimenu.dao.MENUDAO;
import es.upm.dit.isst.mimenu.dao.MENUDAOImpl;
import es.upm.dit.isst.mimenu.dao.PLATODAO;
import es.upm.dit.isst.mimenu.dao.PLATODAOImpl;
import es.upm.dit.isst.mimenu.dao.RESTDAO;
import es.upm.dit.isst.mimenu.dao.RESTDAOImpl;
import es.upm.dit.isst.mimenu.model.COMENSAL;
import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.PLATO;
import es.upm.dit.isst.mimenu.model.RESERVA;
import es.upm.dit.isst.mimenu.model.REST;

public class SearchMenusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
		ObjectifyService.register(COMENSAL.class);
		ObjectifyService.register(MENU.class);
		ObjectifyService.register(PLATO.class);
		ObjectifyService.register(RESERVA.class);
	}
	
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		String fecha = req.getParameter("fecha");
		
		String turno = req.getParameter("turno");
		
		PLATODAO platoDao = PLATODAOImpl.getInstancia();
		MENUDAO menuDao = MENUDAOImpl.getInstancia();
		RESTDAO restDao = RESTDAOImpl.getInstancia();
		
		List<MENU> menus = menuDao.readByFecha(fecha);
		List<PLATO> platos = new ArrayList<PLATO>();
		List<REST> rests = new ArrayList<REST>();
		
		for(MENU menu : menus){
			List<PLATO> platosaux = platoDao.readByMenu(menu.getId()); 
			for(PLATO plato:platosaux)
				if(!platos.contains(plato)){
					platos.add(plato);
				}
			rests.add(restDao.read(menu.getRestEmail()));
		}
		
		System.out.println(turno);
		
		
		req.getSession().setAttribute("menus", menus);
		req.getSession().setAttribute("platos", platos);
		req.getSession().setAttribute("turno", turno);
		req.getSession().setAttribute("rests", rests);
		
		RequestDispatcher view = req.getRequestDispatcher("jsp/showMenusAll.jsp");
		view.forward(req, res);
		
		
	}
}
