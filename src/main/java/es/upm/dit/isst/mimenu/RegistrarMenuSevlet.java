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
import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.REST;

public class RegistrarMenuSevlet extends HttpServlet {
	
	public void init() throws ServletException {
		ObjectifyService.register(MENU.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		
		RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/publicarMenu.jsp");
		view.forward(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		if (req.getSession().getAttribute("userREST") != null){
		
		
			String nombre = req.getParameter("nombre");
			String _1plato1 = req.getParameter("1plato1");
			String _1plato2 = req.getParameter("1plato2");
			String _1plato3 = req.getParameter("1plato3");
			
			String _2plato1 = req.getParameter("2plato1");
			String _2plato2 = req.getParameter("2plato2");
			String _2plato3 = req.getParameter("2plato3");
			
			String _3plato1 = req.getParameter("3plato1");
			String _3plato2 = req.getParameter("3plato2");
			String _3plato3 = req.getParameter("3plato3");
			
			String[][] platos = {{_1plato1,_1plato2,_1plato3},{_2plato1,_2plato2,_2plato3},{_3plato1,_3plato2,_3plato3}};
			
			String precio = req.getParameter("precio");
			String cantidad = req.getParameter("cantidad");
			String fecha = req.getParameter("fecha");
			String turno = req.getParameter("turno");
			String[] categorias = {req.getParameter("categoria")};
			
			String bebida1 = req.getParameter("bebida1");
			String bebida2 = req.getParameter("bebida2");
			String bebida3 = req.getParameter("bebida3");
			
			String[] bebidas = {bebida1,bebida2,bebida3};
			
			REST rest = (REST) req.getSession().getAttribute("rest");
			
			MENUDAO dao = MENUDAOImpl.getInstancia();
			
			dao.create(null, rest, nombre, platos, Double.parseDouble(precio), Integer.parseInt(cantidad), fecha, turno, categorias, bebidas);
		}else{
			res.sendRedirect("/");
		}
		
		
	}

}
