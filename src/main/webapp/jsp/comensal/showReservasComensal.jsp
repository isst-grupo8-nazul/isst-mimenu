<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import= "java.util.List" %>
<%@ page import= "java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

<%
	
	
	HttpSession sessionOk = request.getSession();

	COMENSAL comensal = (COMENSAL) sessionOk.getAttribute("userCOMENSAL");
	List<RESERVA> reservas = (List<RESERVA>) sessionOk.getAttribute("reservas");
	List<MENU> menus = (List<MENU>) sessionOk.getAttribute("menus");
	List<REST> rests = (List<REST>) sessionOk.getAttribute("rests");
	List<PLATO> platos = (List<PLATO>) sessionOk.getAttribute("platos");
	
	
	
	

	if (comensal == null) {
		RequestDispatcher viewer = request.getRequestDispatcher("jsp/restuarante/registroComensal.jsp");
		viewer.forward(request, response);
	}

	String nombre = comensal.getNombre();
	String email = comensal.getEmail();
	String direccion = comensal.getDireccion();
	String telefono = comensal.getTelefono();
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
  		
  		<style>
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

		<!-- Fixed navbar Comensal Registrado-->
		<jsp:include page="../headers/header-usuario.jsp">
			<jsp:param name="nombre" value="<%= nombre %>" />
		</jsp:include>

		<!-- Parte del perfil de comensal -->

		<div class="container perfil-restaurante">
		    <div class="row profile">
				<div class="col-md-3">
					<div class="profile-sidebar">
						<!-- SIDEBAR USERPIC -->
						<div class="profile-userpic">
							<img src="./img/teimoso.gif" class="img-responsive" alt="">
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
								Reservas
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
								<li id="perfil" >
									<a href="/login">
										<i class="fa fa-user-o fa-fw" aria-hidden="true"></i>&nbsp;
										Menus Disponibles
									</a>
								</li>
								<li id="publicar-menu" class="active">
									<a href="/showReservasComensal">
										<i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;
										Reservas
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
					<% if(!menus.isEmpty()){
						
						for(MENU menu : menus){ 
							String bebida="Ron-Cola";
							for(RESERVA reserva : reservas){
								if(reserva.getMenuId().equals(menu.getId())){
									
									bebida = reserva.getBebida();
									break;
								}
							}
							
						
						%>
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
						  	  
						  		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						  			<% for(REST rest : rests){
						  				if(rest.getEmail().equals(menu.getRestEmail())){ %>
						  				 <h4><%= rest.getNombre() %></h4>
						  			<% } } %>
						  		</div>
							  	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
							  		<h4><strong>Primero</strong></h4>
							  		<ul>
							  			<% for(PLATO plato : platos) {
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
							  		<h4><strong>Segundo</strong></h4>
							  		<ul>
							  			<% for(PLATO plato : platos) {
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
							  		<h4><strong>Postre</strong></h4>
							  		<ul>
							  			<% for(PLATO plato : platos) {
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
							  		<h4><strong>Bebida</strong></h4>
							  		<ul>
							  			
							  				<li>
							  					<%= bebida %>
							  				</li>
							  			
							  		</ul>
							  	</div>
						  		<div class="tags col-xs-12 col-sm-12 col-md-12 col-lg-12">
						  			<a href="#" onclick="event.preventDefault();" class="info">
						  				Pagado</i>
						  			</a>
						  			
						  		</div>
						  		</form>
						  			
						  		
						  	</div>
						</div>
					<% } }else{%>
						<p>No tienes reservas por ahora</p>
					<% } %>
					</div>
						
						
						
						
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