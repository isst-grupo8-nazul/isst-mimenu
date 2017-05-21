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

public class LoginServlet extends HttpServlet{
	@Override
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
		ObjectifyService.register(COMENSAL.class);
		ObjectifyService.register(MENU.class);
		ObjectifyService.register(PLATO.class);
		ObjectifyService.register(RESERVA.class);
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
		
		HttpSession sessionOk = req.getSession();
		REST restSession = (REST) sessionOk.getAttribute("userREST");
		COMENSAL comensalSession = (COMENSAL) sessionOk.getAttribute("userCOMENSAL");
		
		if (restSession != null) {
			
			RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/perfil-restaurante.jsp");
			view.forward(req, res);
			
		} else if(comensalSession != null){
			RequestDispatcher view = req.getRequestDispatcher("jsp/comensal/perfil-comensal.jsp");
			view.forward(req, res);
		}else{
			String busqueda = req.getParameter("busqueda");
			if (busqueda.equals("true")){
				boolean login = true;
				req.setAttribute("login", login);
				RequestDispatcher view = req.getRequestDispatcher("jsp/landing.jsp");
				view.forward(req, res);
			} else {
				boolean login = true;
				req.setAttribute("login", login);
				RequestDispatcher view = req.getRequestDispatcher("jsp/landing.jsp");
				view.forward(req, res);
			}
		
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		HttpSession sessionOk = req.getSession();
		REST restSession = (REST) sessionOk.getAttribute("userREST");
		COMENSAL comensalSession=(COMENSAL) sessionOk.getAttribute("userCOMENSAL");
		
		if (restSession != null) {
			
			RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/perfil-restaurante.jsp");
			view.forward(req, res);
			
		} else if (comensalSession != null){
			
			RequestDispatcher view = req.getRequestDispatcher("jsp/comensal/perfil-comensal.jsp");
			view.forward(req, res);
			
		}else{
			RESTDAO restDao = RESTDAOImpl.getInstancia();
			COMENSALDAO comensalDao = COMENSALDAOImpl.getInstancia();

			if (req.getSession().getAttribute("userREST") == null && req.getSession().getAttribute("userCOMENSAL") == null){
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				
				String encoded = sha256(password);
				
				 REST rest = restDao.read(email);
				 COMENSAL comensal = comensalDao.read(email);
				 
				
				 
				 if(rest != null && rest.getPassword().equals(encoded)){
					 req.getSession().setAttribute("userREST", rest);
					 
					 RequestDispatcher view = req.getRequestDispatcher("jsp/restaurante/perfil-restaurante.jsp");
					 view.forward(req, res);
				 }else if(comensal != null && comensal.getPassword().equals(encoded)){
					 req.getSession().setAttribute("userCOMENSAL", comensal);
					 MENUDAO menuDao = MENUDAOImpl.getInstancia();
					 PLATODAO platosDao = PLATODAOImpl.getInstancia();
					 
					
					 List<MENU> menus = menuDao.read();
					 List<PLATO> platos = platosDao.read();
					 List<REST> rests = restDao.read();
					
							
					 req.getSession().setAttribute("menusCOMENSAL", menus);
					 req.getSession().setAttribute("platosCOMENSAL", platos);
					 req.getSession().setAttribute("restsCOMENSAL", rests);
					 RequestDispatcher view = req.getRequestDispatcher("jsp/comensal/perfil-comensal.jsp");
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
}
