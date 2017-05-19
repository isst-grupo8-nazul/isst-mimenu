package es.upm.dit.isst.mimenu;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.Map;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.googlecode.objectify.ObjectifyService;

import es.upm.dit.isst.mimenu.dao.RESTDAO;
import es.upm.dit.isst.mimenu.dao.RESTDAOImpl;
import es.upm.dit.isst.mimenu.model.COMENSAL;
import es.upm.dit.isst.mimenu.model.MENU;
import es.upm.dit.isst.mimenu.model.PLATO;
import es.upm.dit.isst.mimenu.model.REST;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

public class RegistrarRestauranteServlet extends HttpServlet {
	
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
	
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException {
		
		HttpSession sessionOk = request.getSession();
		REST rest = (REST) sessionOk.getAttribute("userREST");
		
		if (rest != null) {
			response.sendRedirect("/loginrest");
		} else {
			//Pasamos el formulario de registro de un restaurante
			RequestDispatcher view = request.getRequestDispatcher("jsp/restaurante/registroRestaurante.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession sessionOk = req.getSession();
		REST rest = (REST) sessionOk.getAttribute("userREST");
		
		if (rest != null) {
			res.sendRedirect("/loginrest");
		} else {
			Map<String, java.util.List<BlobKey>> blobs = blobstoreService.getUploads(req);

			List<BlobKey> blobKeys = blobs.get("logo-restaurante");
			
			String email = req.getParameter("email");
			
			String nombre = req.getParameter("nombre");
			
			String capacidad = req.getParameter("capacidad");
			String password = req.getParameter("password");
			
			String encoded = sha256(password);
			
			String direccion = req.getParameter("direccion");
			String telefono = req.getParameter("telefono");
			String logo = blobKeys.get(0).getKeyString();
			String web = req.getParameter("web");
			String delivery = req.getParameter("delivery");
			Boolean del = false;
			if(delivery.equals("si")){
				del = true;
			}
			
			RESTDAO dao = RESTDAOImpl.getInstancia();
			
			dao.create(nombre, email, Integer.parseInt(capacidad), encoded, direccion, telefono, logo, web, 0, del);
			
			res.sendRedirect("/loginrest");
		}
	}
}
