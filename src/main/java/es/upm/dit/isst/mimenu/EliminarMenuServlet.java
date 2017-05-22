package es.upm.dit.isst.mimenu;

import java.io.IOException;
import java.security.MessageDigest;
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
import es.upm.dit.isst.mimenu.dao.RESTDAO;
import es.upm.dit.isst.mimenu.dao.RESTDAOImpl;
import es.upm.dit.isst.mimenu.model.COMENSAL;
import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.PLATO;
import es.upm.dit.isst.mimenu.model.RESERVA;
import es.upm.dit.isst.mimenu.model.REST;

public class EliminarMenuServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		HttpSession sessionOk = req.getSession();
		REST restSession = (REST) sessionOk.getAttribute("userREST");
		
		if (restSession == null) {
			
			res.sendRedirect("/login");
			
		}else{
			
			MENUDAO dao = MENUDAOImpl.getInstancia();
			
			long menuid = Long.parseLong(req.getParameter("menuId"));
			MENU menu = dao.read(menuid);
			
			menu = dao.deleteMenu(menu);
			
			RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/perfil-restaurante.jsp");
			view.forward(req, res);
		}
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		doGet(req,res);
	}
}
