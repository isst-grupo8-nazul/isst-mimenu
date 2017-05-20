package es.upm.dit.isst.mimenu;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		ObjectifyService.register(RESERVA.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		COMENSAL comensal = (COMENSAL) req.getSession().getAttribute("userCOMENSAL");
		
		PLATODAO platoDao = PLATODAOImpl.getInstancia();
		RESTDAO restDao = RESTDAOImpl.getInstancia();
		MENUDAO menuDao = MENUDAOImpl.getInstancia();
		
		if (comensal != null){
			
			
			PLATO primero = platoDao.readById(Long.parseLong(req.getParameter("primero")));
			PLATO segundo = platoDao.readById(Long.parseLong(req.getParameter("segundo")));
			PLATO postre = platoDao.readById(Long.parseLong(req.getParameter("postre")));
			MENU menu = menuDao.read(primero.getMenuId());
			REST rest = restDao.read(primero.getRestEmail());
			
			PLATO[] platos = {primero, segundo, postre};
			
			String bebida = req.getParameter("bebida");
			
			req.getSession().setAttribute("platos", platos);
			req.getSession().setAttribute("menu", menu);
			req.getSession().setAttribute("bebida", bebida);
			req.getSession().setAttribute("rest", rest);
		
			RequestDispatcher view = req.getRequestDispatcher("jsp/comensal/pagoReserva.jsp");
			view.forward(req, res);
		}else{
			res.sendRedirect("/login");
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession sessionOk = req.getSession();
		COMENSAL comensal = (COMENSAL) req.getSession().getAttribute("userCOMENSAL");
		MENU menu = (MENU) sessionOk.getAttribute("menu");
		PLATO[] platos = (PLATO[]) sessionOk.getAttribute("platos");
		String bebida = (String) sessionOk.getAttribute("bebida");
		REST rest = (REST) sessionOk.getAttribute("rest");
		
		RESERVADAO reservaDao = RESERVADAOImpl.getInstancia();
		for(PLATO plato : platos){
			reservaDao.create(null, comensal.getId(), rest.getEmail(), menu.getId(), plato.getId(), bebida);
		}
		
		//Mandar correo a restaurante
		
		res.sendRedirect("/showReservasComensal");
	}
}
