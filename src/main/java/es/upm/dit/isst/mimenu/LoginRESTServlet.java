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

public class LoginRESTServlet extends HttpServlet{
	@Override
	public void init() throws ServletException {
		ObjectifyService.register(REST.class);
	}
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
		
		RequestDispatcher view = req.getRequestDispatcher("jsp/loginREST.jsp");
		view.forward(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
		      throws IOException, ServletException {
		
	
		RESTDAO dao = RESTDAOImpl.getInstancia();

		if (req.getSession().getAttribute("userREST") == null){
			String email = req.getParameter("email");
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
			
			 REST rest = dao.read(email);
			 if(rest.getPassword().equals(encoded)){
				 req.getSession().setAttribute("userREST", rest);
				 RequestDispatcher view = req.getRequestDispatcher("jsp/perfil-restaurante.jsp");
				 view.forward(req, res);
			 }else{
				 req.getSession().setAttribute("messageLogin", "Password incorrecto");
				 RequestDispatcher view = req.getRequestDispatcher("jsp/loginREST.jsp");
				 view.forward(req, res);
			 }
		}else{
			 req.getSession().setAttribute("messageLogin", "Usuario incorrecto");
			 RequestDispatcher view = req.getRequestDispatcher("jsp/loginREST.jsp");
			 view.forward(req, res);
		}
			
		
		
	}
}
