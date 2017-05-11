package es.upm.dit.isst.mimenu;

import java.io.IOException;
import java.security.MessageDigest;


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
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
	}
	
	public static String sha256(String base) {
	    try{
	        MessageDigest digest = MessageDigest.getInstance("SHA-256");
	        byte[] hash = digest.digest(base.getBytes("UTF-8"));
	        StringBuffer hexString = new StringBuffer();

	        for (int i = 0; i < hash.length; i++) {
	            String hex = Integer.toHexString(0xff & hash[i]);
	            if(hex.length() == 1) hexString.append('0');
	            hexString.append(hex);
	        }

	        return hexString.toString();
	    } catch(Exception ex){
	       throw new RuntimeException(ex);
	    }
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
		
		String encoded = sha256(password);
		
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
