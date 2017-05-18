package es.upm.dit.isst.mimenu;

import java.io.IOException;


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
import es.upm.dit.isst.mimenu.model.REST;
import es.upm.dit.isst.mimenu.model.PLATO;

public class RegistrarMenuSevlet extends HttpServlet {
	
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
		ObjectifyService.register(COMENSAL.class);
		ObjectifyService.register(MENU.class);
		ObjectifyService.register(PLATO.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		if (req.getSession().getAttribute("userREST") != null){
		
			RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/publicarMenu.jsp");
			view.forward(req, res);
		}else{
			res.sendRedirect("/");
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		if (req.getSession().getAttribute("userREST") != null){
		
			MENUDAO menuDao = MENUDAOImpl.getInstancia();
			PLATODAO platosDao = PLATODAOImpl.getInstancia();
			
			String nombre = req.getParameter("nombreMenu");
			double precio = Double.parseDouble(req.getParameter("precio"));
			int cantidad = Integer.parseInt(req.getParameter("cantidad"));
			String fecha = req.getParameter("fecha");
			String turno = req.getParameter("turno");
			String categorias = req.getParameter("categoria");
			
			REST rest = (REST) req.getSession().getAttribute("userREST");
			
			String[] bebidas= {"Agua", "Coca-Cola", "Fanta"};
			
			
			MENU menu = menuDao.create(null, rest.getEmail(), nombre, precio, cantidad, fecha, turno, categorias, bebidas);
			
			int contador = Integer.parseInt(req.getParameter("contador"));
			
			
			for(int i=1;i<=contador;i++){
				String[] plato = req.getParameterValues("plato"+i);
				platosDao.create(null, menu.getId(), rest.getEmail(), plato[0], plato[1], plato[2]);
			}
			
			res.sendRedirect("/showMenusRest");

		}else{
			res.sendRedirect("/loginrest");
		}
		
		
	}

}
