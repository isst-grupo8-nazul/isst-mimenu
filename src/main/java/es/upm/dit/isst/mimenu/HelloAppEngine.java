package es.upm.dit.isst.mimenu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAppEngine extends HttpServlet {

  public void doGet(HttpServletRequest req, HttpServletResponse res) 
      throws IOException, ServletException {
      
	  RequestDispatcher view = req.getRequestDispatcher("jsp/perfil-restaurante.jsp");
	  view.forward(req, res);
  }
}