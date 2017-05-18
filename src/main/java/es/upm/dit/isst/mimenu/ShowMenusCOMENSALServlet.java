package es.upm.dit.isst.mimenu;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
import es.upm.dit.isst.mimenu.model.REST;

public class ShowMenusCOMENSALServlet {
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
		ObjectifyService.register(COMENSAL.class);
		ObjectifyService.register(MENU.class);
		ObjectifyService.register(PLATO.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		COMENSAL comensal = (COMENSAL) req.getSession().getAttribute("userCOMENSAL");
		
		if (comensal != null){
			
			MENUDAO menuDao = MENUDAOImpl.getInstancia();
			PLATODAO platosDao = PLATODAOImpl.getInstancia();
			
			List<MENU> menus = menuDao.read();
			List<PLATO> platos = platosDao.read();
			
					
			req.getSession().setAttribute("menusCOMENSAL", menus);
			req.getSession().setAttribute("platosCOMENSAL", platos);
		
			RequestDispatcher view = req.getRequestDispatcher("jsp/comensal/showMenusComensal.jsp");
			view.forward(req, res);
		}else{
			res.sendRedirect("/login");
		}
	}
}
