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
import es.upm.dit.isst.mimenu.model.REST;

public class ReservaMenuCOMENSALServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
		ObjectifyService.register(COMENSAL.class);
		ObjectifyService.register(MENU.class);
		ObjectifyService.register(PLATO.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		COMENSAL comensal = (COMENSAL) req.getSession().getAttribute("userCOMENSAL");
		
		PLATODAO platoDao = PLATODAOImpl.getInstancia();
		
		if (comensal != null){
			
			PLATO primero = platoDao.readById(Long.parseLong(req.getParameter("primero")));
			PLATO segundo = platoDao.readById(Long.parseLong(req.getParameter("segundo")));
			PLATO postre = platoDao.readById(Long.parseLong(req.getParameter("postre")));
			
			PLATO[] menu = {primero, segundo, postre};
			
			String bebida = req.getParameter("bebida");
					
			req.getSession().setAttribute("menu", menu);
			req.getSession().setAttribute("bebida", bebida);
		
			RequestDispatcher view = req.getRequestDispatcher("jsp/comensal/pagoReserva.jsp");
			view.forward(req, res);
		}else{
			res.sendRedirect("/login");
		}
	}
}
