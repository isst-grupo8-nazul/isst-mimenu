package es.upm.dit.isst.mimenu;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

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
		//Pasamos el formulario de registro de un restaurante
		RequestDispatcher view = request.getRequestDispatcher("jsp/registroRestaurante.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		
		String nombre = req.getParameter("nombre");
		
		String capacidad = req.getParameter("capacidad");
		String password = req.getParameter("password");
		
		MessageDigest digest;
		String encoded ="";
		try {
			digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
			encoded = Base64.getEncoder().encodeToString(hash);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String direccion = req.getParameter("direccion");
		String telefono = req.getParameter("telefono");
		//String logo = req.getParameter("logo-restaurante");
		String logo = "";
		String web = req.getParameter("web");
		String delivery = req.getParameter("delivery");
		Boolean del = false;
		if(delivery.equals("si")){
			del = true;
		}
		
		RESTDAO dao = RESTDAOImpl.getInstancia();
		
		dao.create(nombre, email, Integer.parseInt(capacidad), encoded, direccion, telefono, logo, web, 0, del);
		
		res.sendRedirect("/login");
		
		
	}
}
