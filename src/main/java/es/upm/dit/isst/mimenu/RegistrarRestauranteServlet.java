package es.upm.dit.isst.mimenu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

import es.upm.dit.isst.mimenu.dao.RESTDAO;
import es.upm.dit.isst.mimenu.dao.RESTDAOImpl;
import es.upm.dit.isst.mimenu.model.REST;

public class RegistrarRestauranteServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException {
		
		RequestDispatcher view = request.getRequestDispatcher("jsp/registraRestaurante.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		String nombre = req.getParameter("nombre");
		String capacidad = req.getParameter("capacidad");
		String password = req.getParameter("password");
		String direccion = req.getParameter("direccion");
		String telefono = req.getParameter("telefono");
		String logo = req.getParameter("logo");
		String web = req.getParameter("web");
		
		RESTDAO dao = RESTDAOImpl.getInstancia();
		
		dao.create(nombre, email, Integer.parseInt(capacidad), password, direccion, telefono, logo, web, 0, false);
		
		res.sendRedirect("/login");
		
		
	}
}
