package es.upm.dit.isst.mimenu;

import java.io.IOException;
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
import es.upm.dit.isst.mimenu.model.COMENSAL;
import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.PLATO;
import es.upm.dit.isst.mimenu.model.RESERVA;
import es.upm.dit.isst.mimenu.model.REST;

public class ShowMenusRESTServlet extends HttpServlet {
	
	/**
	 * 
	 */
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
		
		REST rest = (REST) req.getSession().getAttribute("userREST");
		
		if (rest != null){
			
			MENUDAO menuDao = MENUDAOImpl.getInstancia();
			PLATODAO platosDao = PLATODAOImpl.getInstancia();
			
			List<MENU> menus = menuDao.readByRest(rest.getEmail());
			List<PLATO> platos = platosDao.readByREST(rest.getEmail());
					
			req.getSession().setAttribute("menusREST", menus);
			req.getSession().setAttribute("platosREST", platos);
		
			RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/showMenus.jsp");
			view.forward(req, res);
		}else{
			res.sendRedirect("/login");
		}
	}

}
