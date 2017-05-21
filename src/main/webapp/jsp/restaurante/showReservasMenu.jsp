<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import= "java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import="es.upm.dit.isst.mimenu.model.REST" %>
<%@ page import="es.upm.dit.isst.mimenu.model.MENU" %>
<%@ page import="es.upm.dit.isst.mimenu.model.PLATO" %>
<%@ page import="es.upm.dit.isst.mimenu.model.COMENSAL" %>
<%@ page import="es.upm.dit.isst.mimenu.model.RESERVA" %>
<%@ page import="es.upm.dit.isst.mimenu.dao.MENUDAO" %>
<%@ page import="es.upm.dit.isst.mimenu.dao.MENUDAOImpl" %>
<%@ page import="es.upm.dit.isst.mimenu.dao.PLATODAO" %>
<%@ page import="es.upm.dit.isst.mimenu.dao.PLATODAOImpl" %>
<%@ page import="es.upm.dit.isst.mimenu.dao.RESERVADAO" %>
<%@ page import="es.upm.dit.isst.mimenu.dao.RESERVADAOImpl" %>
<%@ page import="es.upm.dit.isst.mimenu.dao.RESTDAO" %>
<%@ page import="es.upm.dit.isst.mimenu.dao.RESTDAOImpl" %>

<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%
	HttpSession sessionOk = request.getSession();

	REST rest = (REST) sessionOk.getAttribute("userREST");
	MENU menu = (MENU) sessionOk.getAttribute("menu");
	List<RESERVA> reservas = (List<RESERVA>) sessionOk.getAttribute("reservas");
	List<COMENSAL> comensales = (List<COMENSAL>) sessionOk.getAttribute("comensales");
	List<PLATO> platos = (List<PLATO>) sessionOk.getAttribute("platos");
	List<PLATO> platosMenu = (List<PLATO>) sessionOk.getAttribute("platosMenu");

	if (rest == null) {
		RequestDispatcher viewer = request.getRequestDispatcher("jsp/restuarante/registroRestaurante.jsp");
		viewer.forward(request, response);
	}

	String nombre = rest.getNombre();
	String email = rest.getEmail();
	String direccion = rest.getDireccion();
	String telefono = rest.getTelefono();
	String web = rest.getWeb();
	int capacidad = rest.getCapacidad();
	String delivery = (rest.isDelivery()) ? "si":"no";
	
	String logo = rest.getLogo();
%>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	String blobKey = logo;
%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>MIMENU - Compara y Reserva tus menús desde tu móvil</title>

		<!-- Estilos y js Bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../../css/font-awesome-4.7.0/css/font-awesome.min.css">

		<!-- enlazo mis propios estilos -->
		<link rel="stylesheet" type="text/css" href="../../css/perfil-restaurante.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		
  		<style type="text/css">
  			#showReservas ul {
			    list-style-type: none;
			    margin: 0px;
			    padding: 10px 10px 0px 0px;
			}
			#showReservas .tags a{text-decoration: none; border:1px solid #DDD;display:inline-block;color:#717171;background:#FFF;-webkit-box-shadow:0 1px 1px 0 rgba(180,180,180,0.1);box-shadow:0 1px 1px 0 rgba(180,180,180,0.1);-webkit-transition:all .1s ease-in-out;-moz-transition:all .1s ease-in-out;-o-transition:all .1s ease-in-out;-ms-transition:all .1s ease-in-out;transition:all .1s ease-in-out;border-radius:2px;margin:0 3px 6px 0;padding:5px 10px}
			#showReservas .tags a.success{cursor:default; text-decoration: none; color:#FFF;background-color:#5CB85C;border-color:#4CAE4C}
			#showReservas .tags a.primary{color:#FFF;background-color:#428BCA;border-color:#357EBD}
			#showReservas .tags a.info{color:#FFF;background-color:#5BC0DE;border-color:#46B8DA}
		</style>
	</head>

	<body>

		<!-- Fixed navbar Restaurante Registrado-->
		<jsp:include page="../headers/header-restaurante.jsp">
			<jsp:param name="nombre" value="<%= nombre %>" />
		</jsp:include>

		<!-- Parte del perfil de restuarante -->

		<div class="container perfil-restaurante">
		    <div class="row profile">
				<div class="col-md-3">
					<div class="profile-sidebar">
						<!-- SIDEBAR USERPIC -->
						<div class="profile-userpic">
							<img src="<a href='/serve-image?blob-key=<%= blobKey %>'>/serve-image?blob-key=<%= blobKey %></a>" class="img-responsive" alt="">
						</div>
						<!-- END SIDEBAR USERPIC -->
						<!-- SIDEBAR USER TITLE -->
						<div class="profile-usertitle">
							<div class="profile-usertitle-name">
								<%= nombre %>
							</div>
							<div class="profile-usertitle-job">
								<%= direccion %>
							</div>
						</div>
						<!-- END SIDEBAR USER TITLE -->
						<!-- SIDEBAR BUTTONS -->
						<div class="profile-userbuttons">
							<a href="/registraMenu" type="button" class="btn btn-success btn-sm">
								<i class="fa fa-upload fa-fw" aria-hidden="true"></i>&nbsp;
								Publicar Menú
							</a>
							<a href="/logout" type="button" class="btn btn-danger btn-sm">
								<i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;
								Logout
							</a>
						</div>
						<!-- END SIDEBAR BUTTONS -->
						<!-- SIDEBAR MENU -->
						<div class="profile-usermenu">
							<ul class="nav">
								<li id="perfil">
									<a href="/login">
										<i class="fa fa-user-o fa-fw" aria-hidden="true"></i>&nbsp;
										Perfil
									</a>
								</li>
								<li id="publicar-menu">
									<a href="/registraMenu">
										<i class="fa fa-upload fa-fw" aria-hidden="true"></i>&nbsp;
										Publicar Menú
									</a>
								</li>
								<li id="mis-menus" class="active">
									<a href="/showMenusRest">
										<i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;
										Mis Menús
									</a>
								</li>
								<li id="mis-ajustes">
									<a href="#">
										<i class="fa fa-comments fa-fw" aria-hidden="true"></i>&nbsp;
										Ver comentarios
									</a>
								</li>
								<li id="logout">
									<a href="/logout">
										<i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;
										Logout
									</a>
								</li>
							</ul>
						</div>
						<!-- END MENU -->
					</div>
				</div>

				<div id="showReservas" class="col-sm-9">
				
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3>
								
								<strong><%= menu.getNombre() %></strong>
								<span class="label label-info">
									<span class="glyphicon glyphicon-tag"></span> <%= menu.getCategorias() %>
								</span>
							</h3>
						</div>
					  	<div class="panel-body">
						  	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						  		<h4><strong>Primeros</strong></h4>
						  		<ul>
						  			<% for(PLATO plato : platosMenu) {
						  				if(plato.getMenuId().equals(menu.getId()) && plato.getTipo().equals("primero")){%>
						  				<li>
						  					<%=plato.getNombre() %>
						  					<span class="label label-info pull-right">
						  						<span class="glyphicon glyphicon-tag"></span><%=plato.getCategoria() %>
						  					</span>
						  				</li>
						  			<% }} %>
						  		</ul>
						  	</div>
						  	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						  		<h4><strong>Segundos</strong></h4>
						  		<ul>
						  			<% for(PLATO plato : platosMenu) {
						  				if(plato.getMenuId().equals(menu.getId()) && plato.getTipo().equals("segundo")){%>
						  				<li>
						  					<%=plato.getNombre() %>
						  					<span class="label label-info pull-right">
						  						<span class="glyphicon glyphicon-tag"></span><%=plato.getCategoria() %>
						  					</span>
						  				</li>
						  			<% }} %>
						  		</ul>
						  	</div>
						  	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
						  		<h4><strong>Postres</strong></h4>
						  		<ul>
						  			<% for(PLATO plato : platosMenu) {
						  				if(plato.getMenuId().equals(menu.getId()) && plato.getTipo().equals("postre")){%>
						  				<li>
						  					<%=plato.getNombre() %>
						  					<span class="label label-info pull-right">
						  						<span class="glyphicon glyphicon-tag"></span> <%=plato.getCategoria() %>
						  					</span>
						  				</li>
						  			<% }} %>
						  		</ul>
						  	</div>
						  	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
						  		<h4><strong>Bebidas</strong></h4>
						  		<ul>
						  			<% for(String bebida : menu.getBebidas()){%>
						  				<li>
						  					<%= bebida %>
						  				</li>
						  			<% } %>
						  		</ul>
						  	</div>
					  		<div class="tags col-xs-12 col-sm-12 col-md-12 col-lg-12">
					  			<a href="#" onclick="event.preventDefault();" class="success">
					  				<%= menu.getPrecio() %> <i class="fa fa-eur" aria-hidden="true"></i>
					  			</a>
					  			<a href="#" onclick="event.preventDefault();">
					  				<%= comensales.size() %>/<%= menu.getCantidad() %> uds. reservadas
					  			</a>
					  			<a href="#" onclick="event.preventDefault();">
					  				<%= menu.getFecha() %>
					  			</a>
					  			<a href="#" onclick="event.preventDefault();">
					  				<%= menu.getTurno() %>
					  			</a>
					  		</div>
					  	</div>
					</div>
					
					<% if(reservas.size() > 0){ %>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
						      <tr>
						        <th>Nombre comensal</th>
						        <th>Primero</th>
						        <th>Segundo</th>
						        <th>Postre</th>
						        <th>Bebida</th>
						      </tr>
						    </thead>
						    <tbody>
						    	<% for(COMENSAL comensal : comensales){ %>
						    		<tr>
							    	<td><%= comensal.getNombre() %></td>
							    	<td>
							    		<% for(RESERVA reserva : reservas){ 
							    			for(PLATO plato : platos){
							    				if(reserva.getComensalId().equals(comensal.getId()) && plato.getId().equals(reserva.getPlatoId()) && plato.getTipo().equals("primero")){
							    			%>
							    			<%= plato.getNombre() %>
							    		<% break;} } } %>
							    	</td>
							    	<td>
							    		<% for(RESERVA reserva : reservas){ 
							    			for(PLATO plato : platos){
							    				if(reserva.getComensalId().equals(comensal.getId()) && plato.getId().equals(reserva.getPlatoId()) && plato.getTipo().equals("segundo")){
							    			%>
							    			<%= plato.getNombre() %>
							    		<% break;} } } %>
							    	</td>
							    	<td>
							    		<% for(RESERVA reserva : reservas){ 
							    			for(PLATO plato : platos){
							    				if(reserva.getComensalId().equals(comensal.getId()) && plato.getId().equals(reserva.getPlatoId()) && plato.getTipo().equals("postre")){
							    			%>
							    			<%= plato.getNombre() %>
							    		<% break;} } } %>
							    	</td>
							    	<td>
							    		<% for(RESERVA reserva : reservas){ 
							    			
							    				if(reserva.getComensalId().equals(comensal.getId())){
							    			%>
							    			<%= reserva.getBebida() %>
							    		<% break; } }  %>
							    	</td>
							    	</tr>
						    	<% } %>
						    </tbody>
						</table>
					
					
					</div>
					<% } else { %>
						No hay reservas de este menú aún
					<% } %>

					
				</div>
			</div>
		</div>

		<!-- Parte del footer -->
		<jsp:include page="../footer/footer.jsp"/>
	<script>
		$(function(){
		
			$('#slide-submenu').on('click',function() {			        
		        $(this).closest('.list-group').fadeOut('slide',function(){
		        	$('.mini-submenu').fadeIn();	
		        });
		        
		      });
		
			$('.mini-submenu').on('click',function(){		
		        $(this).next('.list-group').toggle('slide');
		        $('.mini-submenu').hide();
			})
		})

	</script>
	</body>
</html>