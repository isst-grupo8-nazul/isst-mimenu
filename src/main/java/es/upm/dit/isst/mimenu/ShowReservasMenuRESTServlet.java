package es.upm.dit.isst.mimenu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.googlecode.objectify.ObjectifyService;

import es.upm.dit.isst.mimenu.dao.COMENSALDAO;
import es.upm.dit.isst.mimenu.dao.COMENSALDAOImpl;
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

public class ShowReservasMenuRESTServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
		ObjectifyService.register(COMENSAL.class);
		ObjectifyService.register(MENU.class);
		ObjectifyService.register(PLATO.class);
		ObjectifyService.register(RESERVA.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		HttpSession sessionOk = req.getSession();
		REST rest = (REST) sessionOk.getAttribute("userREST");
		
		if(rest!= null){
			RESERVADAO reservaDao = RESERVADAOImpl.getInstancia();
			PLATODAO platoDao = PLATODAOImpl.getInstancia();
			RESTDAO restDao = RESTDAOImpl.getInstancia();
			MENUDAO menuDao = MENUDAOImpl.getInstancia();
			COMENSALDAO comensalDao = COMENSALDAOImpl.getInstancia();
			
			List<RESERVA> reservas = reservaDao.readByMenuId(Long.parseLong(req.getParameter("menuId")));
			MENU menu = menuDao.read(Long.parseLong(req.getParameter("menuId")));
			List<PLATO> platosMenu = platoDao.readByMenu(Long.parseLong(req.getParameter("menuId")));
			
			List<COMENSAL> comensales = new ArrayList<COMENSAL>();
			List<PLATO> platos = new ArrayList<PLATO>();
			
			for(RESERVA reserva: reservas){
				
				COMENSAL comensal = comensalDao.readById((reserva.getComensalId()));
				if(comensal !=null && !comensales.contains(comensal)){
					comensales.add(comensal);
				}
				
				PLATO plato = platoDao.readById(reserva.getPlatoId());
				if(plato !=null && !platos.contains(plato)){
					platos.add(plato);
				}
				
			}
			
			req.getSession().setAttribute("reservas", reservas);
			req.getSession().setAttribute("platos", platos);
			req.getSession().setAttribute("platosMenu", platosMenu);
			req.getSession().setAttribute("menu", menu);
			req.getSession().setAttribute("comensales", comensales);
			
			RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/showReservasMenu.jsp");
			view.forward(req, res);
			
		}else{
			res.sendRedirect("/login");
		}
	}
	
}
