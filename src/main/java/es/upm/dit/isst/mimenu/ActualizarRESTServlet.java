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

public class ActualizarRESTServlet extends HttpServlet{
	
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
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		HttpSession sessionOk = req.getSession();
		REST restSession = (REST) sessionOk.getAttribute("userREST");
		
		if (restSession == null) {
			
			res.sendRedirect("/login");
			
		}else{
			RESTDAO dao = RESTDAOImpl.getInstancia();
			
			System.out.println(req.getParameter("email"));
			System.out.println(req.getParameter("nombre"));
			System.out.println(req.getParameter("password"));
			System.out.println(req.getParameter("capacidad"));
			System.out.println(req.getParameter("direccion"));
			System.out.println(req.getParameter("telefono"));
			System.out.println(req.getParameter("web"));
			System.out.println(req.getParameter("delivery"));
			
			REST rest = dao.read(req.getParameter("email"));
			
			String nombre = (req.getParameter("nombre") != null && req.getParameter("nombre") != "") ? req.getParameter("nombre"):restSession.getNombre();
			String password = "";
			String encoded = "";
			if (req.getParameter("password") != null && req.getParameter("password") != "") {
				password = req.getParameter("password");
				encoded = sha256(password);
			} else {
				password = restSession.getPassword();
				encoded = restSession.getPassword();
			}
			System.out.println(password);
			String capacidad = req.getParameter("capacidad");
			String direccion = req.getParameter("direccion");
			String telefono = req.getParameter("telefono");
			String web = (req.getParameter("web") != null && req.getParameter("web") != "") ? req.getParameter("web"):restSession.getWeb();
			String delivery = req.getParameter("delivery");
			Boolean del = false;
			if(delivery.equals("si")){
				del = true;
			}
			
			rest.setNombre(nombre);
			rest.setPassword(encoded);
			rest.setCapacidad(Integer.parseInt(capacidad));
			rest.setDireccion(direccion);
			rest.setTelefono(telefono);
			rest.setWeb(web);
			rest.setDelivery(del);
			
			rest = dao.updateREST(rest);
			
			sessionOk.setAttribute("userREST", rest);
			
			RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/perfil-restaurante.jsp");
			view.forward(req, res);
		}
	}
}
