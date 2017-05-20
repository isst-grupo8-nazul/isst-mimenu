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
import es.upm.dit.isst.mimenu.dao.RESERVADAO;
import es.upm.dit.isst.mimenu.dao.RESERVADAOImpl;
import es.upm.dit.isst.mimenu.dao.RESTDAO;
import es.upm.dit.isst.mimenu.dao.RESTDAOImpl;

import es.upm.dit.isst.mimenu.model.COMENSAL;
import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.PLATO;
import es.upm.dit.isst.mimenu.model.RESERVA;
import es.upm.dit.isst.mimenu.model.REST;

public class ShowReservasComensalServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;


	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
		ObjectifyService.register(COMENSAL.class);
		ObjectifyService.register(MENU.class);
		ObjectifyService.register(PLATO.class);
		ObjectifyService.register(RESERVA.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		COMENSAL comensal = (COMENSAL) req.getSession().getAttribute("userCOMENSAL");
		
		if (comensal != null){
			RESERVADAO reservaDao = RESERVADAOImpl.getInstancia();
			PLATODAO platoDao = PLATODAOImpl.getInstancia();
			RESTDAO restDao = RESTDAOImpl.getInstancia();
			MENUDAO menuDao = MENUDAOImpl.getInstancia();
			
			List<RESERVA> reservas = reservaDao.readByComensalId(comensal.getId());
			
			List<MENU> menus = new ArrayList<MENU>();
			List<REST> rests = new ArrayList<REST>();
			List<PLATO> platos = new ArrayList<PLATO>();
			
			
			for(RESERVA reserva: reservas){
				MENU menu = menuDao.read(reserva.getMenuId());
				if(menu != null && !menus.contains(menu)){
					menus.add(menu);
				}
				
				REST rest = restDao.read(reserva.getRestEmail());
				if(rest !=null && !rests.contains(rest)){
					rests.add(rest);
				}
				
				PLATO plato = platoDao.readById(reserva.getPlatoId());
				if(plato !=null && !platos.contains(plato)){
					platos.add(plato);
				}
				
			}
			
			
			req.getSession().setAttribute("reservas", reservas);
			req.getSession().setAttribute("platos", platos);
			req.getSession().setAttribute("menus", menus);
			req.getSession().setAttribute("rests", rests);
			
			RequestDispatcher view = req.getRequestDispatcher("jsp/comensal/showReservasComensal.jsp");
			view.forward(req, res);
		}else{
			res.sendRedirect("/login");
		}
	}
}
