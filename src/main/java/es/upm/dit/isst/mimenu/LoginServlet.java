package es.upm.dit.isst.mimenu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class LoginServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException {
		      
		UserService userService = UserServiceFactory.getUserService();
		String url = userService.createLoginURL(request.getRequestURI());
		String urlLinktext = "Login";
		String user = "";

		if (request.getUserPrincipal() != null){
			user = request.getUserPrincipal().getName();
			url = userService.createLogoutURL("/");
			urlLinktext = "Logout";
			
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("url", url);
			request.getSession().setAttribute("urlLinktext", urlLinktext);
			
			RequestDispatcher view = request.getRequestDispatcher("jsp/perfil-restaurante.jsp");
			view.forward(request, response);
		}else{
			response.sendRedirect(url);
		}

		

	}

}
