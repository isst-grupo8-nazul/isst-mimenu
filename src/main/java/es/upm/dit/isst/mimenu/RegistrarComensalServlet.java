package es.upm.dit.isst.mimenu;

import java.io.IOException;
import java.security.MessageDigest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.googlecode.objectify.ObjectifyService;

import es.upm.dit.isst.mimenu.dao.COMENSALDAO;
import es.upm.dit.isst.mimenu.dao.COMENSALDAOImpl;
import es.upm.dit.isst.mimenu.dao.RESTDAO;
import es.upm.dit.isst.mimenu.dao.RESTDAOImpl;
import es.upm.dit.isst.mimenu.model.COMENSAL;
import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.PLATO;
import es.upm.dit.isst.mimenu.model.REST;

public class RegistrarComensalServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
		ObjectifyService.register(COMENSAL.class);
		ObjectifyService.register(MENU.class);
		ObjectifyService.register(PLATO.class);
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
		
		HttpSession sessionOk = request.getSession();
		REST rest = (REST) sessionOk.getAttribute("userREST");
		COMENSAL comensal = (COMENSAL) sessionOk.getAttribute("userCOMENSAL");
		
		if (rest != null || comensal != null) {
			response.sendRedirect("/login");
		} else {
			//Pasamos el formulario de registro de un restaurante
			RequestDispatcher view = request.getRequestDispatcher("jsp/comensal/registroComensal.jsp");
			view.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession sessionOk = req.getSession();
		REST rest = (REST) sessionOk.getAttribute("userREST");
		COMENSAL comensal = (COMENSAL) sessionOk.getAttribute("userCOMENSAL");
		
		if (rest != null || comensal != null) {
			res.sendRedirect("/login");
		} else {
			String email = req.getParameter("email");
			
			String nombre = req.getParameter("nombre");
			
			
			String password = req.getParameter("password");
			
			String encoded = sha256(password);
			
			String direccion = req.getParameter("direccion");
			String telefono = req.getParameter("telefono");
			
			COMENSALDAO dao = COMENSALDAOImpl.getInstancia();
			
			dao.create(null, email, nombre, encoded, direccion, telefono, 0);
			
			res.sendRedirect("/login");
		}
	}
}
