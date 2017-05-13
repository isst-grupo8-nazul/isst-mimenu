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

public class LoginRESTServlet extends HttpServlet{
	@Override
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
	}
	
	private static final long serialVersionUID = 1L;
	
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
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		boolean loginrest = true;
		req.setAttribute("loginrest", loginrest);
		RequestDispatcher view = req.getRequestDispatcher("jsp/landing.jsp");
		view.forward(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		RESTDAO dao = RESTDAOImpl.getInstancia();

		if (req.getSession().getAttribute("userREST") == null){
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			String encoded = sha256(password);
			
			 REST rest = dao.read(email);
			 
			 if(rest.getPassword().equals(encoded)){
				 req.getSession().setAttribute("userREST", rest);
				 RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/perfil-restaurante.jsp");
				 view.forward(req, res);
			 }else{
				 req.getSession().setAttribute("messageLogin", "Password incorrecto");
				 RequestDispatcher view = req.getRequestDispatcher("jsp/landing.jsp");
				 view.forward(req, res);
			 }
		}else{
			
			 req.getSession().setAttribute("messageLogin", "Usuario incorrecto");
			 RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/perfil-restaurante.jsp");
			 view.forward(req, res);
		}	
	}
}
