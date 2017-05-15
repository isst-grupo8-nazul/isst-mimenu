<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import= "java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="es.upm.dit.isst.mimenu.model.REST" %>
<%@ page import="es.upm.dit.isst.mimenu.model.MENU" %>
<%@ page import="es.upm.dit.isst.mimenu.model.PLATO" %>

<%
	HttpSession sessionOk = request.getSession();

	REST rest = (REST) sessionOk.getAttribute("userREST");
	
	List<MENU> menus = (List<MENU>) sessionOk.getAttribute("menusREST");
	List<PLATO> platos = (List<PLATO>) sessionOk.getAttribute("platosREST");

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
			#showMenus ul {
			    list-style-type: none;
			    margin: 0px;
			    padding: 10px;
			}
			#showMenus .tags a{text-decoration: none; border:1px solid #DDD;display:inline-block;color:#717171;background:#FFF;-webkit-box-shadow:0 1px 1px 0 rgba(180,180,180,0.1);box-shadow:0 1px 1px 0 rgba(180,180,180,0.1);-webkit-transition:all .1s ease-in-out;-moz-transition:all .1s ease-in-out;-o-transition:all .1s ease-in-out;-ms-transition:all .1s ease-in-out;transition:all .1s ease-in-out;border-radius:2px;margin:0 3px 6px 0;padding:5px 10px}
			#showMenus .tags a.success{text-decoration: none; color:#FFF;background-color:#5CB85C;border-color:#4CAE4C}
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
								Publicar Menú
							</a>
							<a href="/logoutREST" type="button" class="btn btn-danger btn-sm">
								<i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;
								Logout
							</a>
						</div>
						<!-- END SIDEBAR BUTTONS -->
						<!-- SIDEBAR MENU -->
						<div class="profile-usermenu">
							<ul class="nav">
								<li class="active">
									<a href="/loginrest">
										<i class="fa fa-user-o fa-fw" aria-hidden="true"></i>&nbsp;
										Perfil
									</a>
								</li>
								<li>
									<a href="/registraMenu">
										<i class="fa fa-upload fa-fw" aria-hidden="true"></i>&nbsp;
										Publicar Menú
									</a>
								</li>
								<li>
									<a href="/showMenusRest">
										<i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;
										Mis Menús
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-cog fa-fw" aria-hidden="true"></i>&nbsp;
										Mis Ajustes
									</a>
								</li>
								<li>
									<a href="/logoutREST">
										<i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;
										Logout
									</a>
								</li>
							</ul>
						</div>
						<!-- END MENU -->
					</div>
				</div>

				<div id="showMenus" class="col-sm-9">
				<% if(!menus.isEmpty()){
					for(MENU menu : menus){ %>
					<div class="panel panel-default">
					  <div class="panel-body">
					  	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					  		<span><h3><%= menu.getNombre() %></h3></span><span class="label label-info"><span class="glyphicon glyphicon-tag"></span><%= menu.getCategorias() %></span>
					  	</div>
					  	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					  		<h4>Primeros</h4>
					  		<ul>
					  			<% for(PLATO plato : platos) {
					  				if(plato.getMenuId().equals(menu.getId()) && plato.getTipo().equals("primero")){%>
					  				<li><%=plato.getNombre() %> <span class="label label-info"><span class="glyphicon glyphicon-tag"></span><%=plato.getCategoria() %></span></li>
					  			<% }} %>
					  		</ul>
					  	</div>
					  	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					  		<h4>Segundos</h4>
					  		<ul>
					  			<% for(PLATO plato : platos) {
					  				if(plato.getMenuId().equals(menu.getId()) && plato.getTipo().equals("segundo")){%>
					  				<li><%=plato.getNombre() %> <span class="label label-info"><span class="glyphicon glyphicon-tag"></span><%=plato.getCategoria() %></span></li>
					  			<% }} %>
					  		</ul>
					  	</div>
					  	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					  		<h4>Postres</h4>
					  		<ul>
					  			<% for(PLATO plato : platos) {
					  				if(plato.getMenuId().equals(menu.getId()) && plato.getTipo().equals("postre")){%>
					  				<li><%=plato.getNombre() %> <span class="label label-info"><span class="glyphicon glyphicon-tag"></span><%=plato.getCategoria() %></span></li>
					  			<% }} %>
					  		</ul>
					  	</div>
					  	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					  		<h4>Bebidas</h4>
					  		<ul>
					  			<% for(String bebida : menu.getBebidas()){%>
					  				<li><%= bebida %></li>
					  			<% } %>
					  			
					  		</ul>
					  	</div>
					  	<div class="tags col-xs-12 col-sm-12 col-md-12 col-lg-12">
					  			<a href="#" onclick="event.preventDefault();" class="success"><%= menu.getPrecio() %> €</a>
					  			<a href="#" onclick="event.preventDefault();"><%= menu.getCantidad() %> uds.</a>
					  			<a href="#" onclick="event.preventDefault();"><%= menu.getFecha() %></a>				  		
					  			<a href="#" onclick="event.preventDefault();"><%= menu.getTurno() %></a>
					  	</div>
					  </div>
					</div>
				<% } }else{%>
					<p>No has publicado menús por ahora</p>
				<% } %>
				</div>
			</div>
		</div>

		<!-- Parte del footer -->
		<jsp:include page="../footer/footer.jsp"/>
	</body>
</html>