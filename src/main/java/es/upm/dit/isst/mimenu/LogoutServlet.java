package es.upm.dit.isst.mimenu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.googlecode.objectify.ObjectifyService;

import es.upm.dit.isst.mimenu.model.COMENSAL;
import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.PLATO;
import es.upm.dit.isst.mimenu.model.RESERVA;
import es.upm.dit.isst.mimenu.model.REST;

public class LogoutServlet  extends HttpServlet{
	@Override
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
		ObjectifyService.register(COMENSAL.class);
		ObjectifyService.register(MENU.class);
		ObjectifyService.register(PLATO.class);
		ObjectifyService.register(RESERVA.class);
	}
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		
		if (session != null) {
		    session.invalidate();
		}
		
		res.sendRedirect("/");
	}
}
