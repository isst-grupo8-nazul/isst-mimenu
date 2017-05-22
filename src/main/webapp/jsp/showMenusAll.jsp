<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import= "java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="es.upm.dit.isst.mimenu.model.REST" %>
<%@ page import="es.upm.dit.isst.mimenu.model.MENU" %>
<%@ page import="es.upm.dit.isst.mimenu.model.PLATO" %>
<%@ page import="es.upm.dit.isst.mimenu.model.COMENSAL" %>

<%

	HttpSession sessionOk = request.getSession();

	REST resta = (REST) sessionOk.getAttribute("userREST");
	COMENSAL comensal = (COMENSAL) sessionOk.getAttribute("userCOMENSAL");

	List<MENU> menus = (List<MENU>) sessionOk.getAttribute("menus");
	List<PLATO> platos = (List<PLATO>) sessionOk.getAttribute("platos");
	List<REST> rests = (List<REST>) sessionOk.getAttribute("rests");
	String turno = (String) sessionOk.getAttribute("turno");
	
	String fecha = (String) sessionOk.getAttribute("fecha");

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
		
		<link rel="stylesheet" type="text/css" href="./../css/perfil-restaurante.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  		<style>
			#showMenus ul {
			    list-style-type: none;
			    margin: 0px;
			    padding: 10px 10px 0px 0px;
			}
			#showMenus .tags a{text-decoration: none; border:1px solid #DDD;display:inline-block;color:#717171;background:#FFF;-webkit-box-shadow:0 1px 1px 0 rgba(180,180,180,0.1);box-shadow:0 1px 1px 0 rgba(180,180,180,0.1);-webkit-transition:all .1s ease-in-out;-moz-transition:all .1s ease-in-out;-o-transition:all .1s ease-in-out;-ms-transition:all .1s ease-in-out;transition:all .1s ease-in-out;border-radius:2px;margin:0 3px 6px 0;padding:5px 10px}
			#showMenus .tags a.success{cursor:default; text-decoration: none; color:#FFF;background-color:#5CB85C;border-color:#4CAE4C}
			#showMenus .tags a.primary{color:#FFF;background-color:#428BCA;border-color:#357EBD}
		</style>

	</head>

	<body>

		<!-- Fixed navbar Normal -->
		<% if (resta != null) {
			String nombreRest = resta.getNombre();
			String emailRest = resta.getEmail();
			String direccionRest = resta.getDireccion();
			String telefonoRest = resta.getTelefono();
			String webRest = resta.getWeb();
			int capacidadRest = resta.getCapacidad();
			String deliveryRest = (resta.isDelivery()) ? "si":"no";
		%>
	    	<jsp:include page="./headers/header-restaurante.jsp">
	    		<jsp:param name="nombre" value="<%= nombreRest %>" />
	    	</jsp:include>
	    <% } else if ( comensal != null) { %>
			<jsp:include page="./headers/header-usuario.jsp">
				<jsp:param name="nombre" value="<%= comensal.getNombre() %>" />
	    	</jsp:include>
		<% } else { %>
			<jsp:include page="./headers/header.jsp"/>
		<% } %>

		<!-- Parte del perfil de comensal -->

		<div class="container perfil-restaurante">
		    <div class="row profile">
				<div class="col-md-3">
					<div class="profile-sidebar">
						<!-- SIDEBAR USER TITLE -->
						<div class="profile-usertitle">
							<div class="profile-usertitle-name">
								Filtrar Resultados
							</div>
						</div>
						<!-- END SIDEBAR USER TITLE -->
						<!-- SIDEBAR MENU -->
						<div class="profile-usermenu">
							<form method="get" action="/buscar" class="form-horizontal" >
					            <fieldset>
					
					                <!-- Nombre y apellidos -->
					                <div class="form-group">
					                    <label class="col-xs-12 control-label" for="fecha">
					                    	<p class="pull-left" style="margin-left: 5px;">Fecha:</p>
					                    </label>
					                    <div class="col-xs-12">
					                        <input id="fecha" name="fecha" type="date" value="<%= fecha %>" class="form-control input-md">
					                    </div>
					                </div>
					
					                <!-- Teléfono -->
					                <div class="form-group">
					                    <label class="col-xs-12 control-label" for="turno">
					                    	<p class="pull-left" style="margin-left: 5px;">Turno:</p>
					                    </label>
					                    <div class="col-xs-12">
					                        <select name="turno">
					                        	<% if (turno.equals("comida")) { %>
													<option value="comida" selected>Comida</option>
												  	<option value="cena">Cena</option>
												<% } else { %>
													<option value="comida">Comida</option>
												  	<option value="cena" selected>Cena</option>
												<% } %>
											</select>
					                    </div>
					                </div>
					
					                <!-- Button Filtrar -->
					                <div class="col-md-12 text-center">
					                    <input type="submit" value="Filtrar Resultados" class="btn btn-success">
					                </div>
					            </fieldset>
					        </form>
						</div>
						<!-- END MENU -->
					</div>
				</div>

				<div id="showMenus" class="col-sm-9">

					<% if (comensal == null && resta == null) {%>
						<% if(!menus.isEmpty()){
							int contador = 0;
							for(MENU menu : menus){
								if(menu.getTurno().equals(turno)){
									contador++;
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
										  		<h4><strong>Primeros</strong></h4>
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
										  		<h4><strong>Segundos</strong></h4>
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
										  		<h4><strong>Postres</strong></h4>
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
									  			<a href="/login?busqueda=busqueda" class="info">
									  				Reservar
									  			</a>
									  		</div>
									  	</div>
									</div>
							<%	} %>
							<%
							}
							if (contador == 0) { %>
								<p>No hay publicados menús con estas características</p>
							<% } %>
						<% } else { %>
								<p>No hay publicados menús con estas características</p>
						<% } %>
					<% } else if (resta != null) { %>
						<% if(!menus.isEmpty()){
							int contador = 0;
							for(MENU menu : menus){
								if(menu.getTurno().equals(turno)){
									contador++;
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
										  		<h4><strong>Primeros</strong></h4>
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
										  		<h4><strong>Segundos</strong></h4>
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
										  		<h4><strong>Postres</strong></h4>
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
									  		</div>
									  	</div>
									</div>
							<%	} %>
							<%
							}
							if (contador == 0) { %>
								<p>No hay publicados menús con estas características</p>
							<% } %>
						<% } else { %>
								<p>No hay publicados menús con estas características</p>
						<% } %>
					<% } else if(comensal != null) {%>
						<% if(!menus.isEmpty()){
							int contador = 0;
							for(MENU menu : menus) {
								if(menu.getTurno().equals(turno)){
								contador++;
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
									  		<form action="/reservaMenu" method="get" id="menu<%= menu.getId() %>">
										  	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
										  		<h4><strong>Primeros</strong></h4>
										  		<ul>
										  			<% for(PLATO plato : platos) {
										  				if(plato.getMenuId().equals(menu.getId()) && plato.getTipo().equals("primero")){%>
										  				<li>
										  					<input type="radio" name="primero" value="<%=plato.getId() %>"><%=plato.getNombre() %>
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
										  			<% for(PLATO plato : platos) {
										  				if(plato.getMenuId().equals(menu.getId()) && plato.getTipo().equals("segundo")){%>
										  				<li>
										  					<input type="radio" name="segundo" value="<%=plato.getId() %>"><%=plato.getNombre() %>
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
										  			<% for(PLATO plato : platos) {
										  				if(plato.getMenuId().equals(menu.getId()) && plato.getTipo().equals("postre")){%>
										  				<li>
										  					<input type="radio" name="postre" value="<%=plato.getId() %>"><%=plato.getNombre() %>
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
										  					<input type="radio" name="bebida" value="<%= bebida %>"><%= bebida %>
										  				</li>
										  			<% } %>
										  		</ul>
										  	</div>
									  		<div class="tags col-xs-12 col-sm-12 col-md-12 col-lg-12">
									  			<a href="#" onclick="event.preventDefault();" class="success">
									  				<%= menu.getPrecio() %> <i class="fa fa-eur" aria-hidden="true"></i>
									  			</a>
									  			<a href="#" onclick="document.getElementById('menu<%= menu.getId() %>').submit();" class="primary">Reservar</a>
									  		</div>
									  		</form>
									  	</div>
									</div>
								<%	} %>
						<%
							}
							if (contador == 0) { %>
								<p>No hay publicados menús con estas características</p>
							<% } %>
						<% } else { %>
							<p>No hay publicados menús por ahora</p>
						<% } %>
					<% } %>
				</div>
			</div>
		</div>

		<!-- Parte del footer -->
		<jsp:include page="./footer/footer.jsp"/>
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