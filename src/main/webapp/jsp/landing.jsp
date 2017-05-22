<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="es.upm.dit.isst.mimenu.model.REST" %>
<%@ page import="es.upm.dit.isst.mimenu.model.MENU" %>
<%@ page import="es.upm.dit.isst.mimenu.model.COMENSAL" %>

<% boolean login = (Boolean) request.getAttribute("login"); %>
<%
	HttpSession sessionOk = request.getSession();

	REST rest = (REST) sessionOk.getAttribute("userREST");
 	COMENSAL comensal = (COMENSAL) sessionOk.getAttribute("userCOMENSAL");

 	String busqueda = (String) request.getParameter("busqueda");
%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>MiMenú - Tu web para reservar tus menús al mejor precio.</title>

		<!-- Estilos y js Bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../css/font-awesome-4.7.0/css/font-awesome.min.css">

		<!-- enlazo mis propios estilos -->
		<link rel="stylesheet" type="text/css" href="../css/landing.css">
		<link rel="stylesheet" href="../css/pickaday.css">

  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  		<script src="../js/rating.js"></script>
  		<script src="../js/pickaday.js"></script>
  		<script src="../js/moment.js"></script>

	</head>
	<body>

		<!-- Fixed navbar Normal -->
		<% if (rest != null) {
			String nombreRest = rest.getNombre();
			String emailRest = rest.getEmail();
			String direccionRest = rest.getDireccion();
			String telefonoRest = rest.getTelefono();
			String webRest = rest.getWeb();
			int capacidadRest = rest.getCapacidad();
			String deliveryRest = (rest.isDelivery()) ? "si":"no";
		%>
	    	<jsp:include page="./headers/header-restaurante.jsp">
	    		<jsp:param name="nombre" value="<%= nombreRest %>" />
	    	</jsp:include>
	    <% } else if ( comensal != null) { %>
			<jsp:include page="./headers/header-usuario.jsp">
				<jsp:param name="nombre" value="<%= comensal.getNombre() %>" />
	    	</jsp:include>
		<% } else { %>
			<% if (busqueda != null && busqueda.equals("busqueda")) { %>
				<jsp:include page="./headers/header.jsp">
						<jsp:param name="busqueda" value="<%= busqueda %>" />
				</jsp:include>
			<% } else { %>
				<jsp:include page="./headers/header.jsp"/>
			<% } %>
		<% } %>
		<!-- Parte de la imagen de fondo con buscador -->
		<div class="jumbotron text-center">
			<h1> Reserva tu Menú </h1>
			<p> Busca el menú que más te apetezca y resérvalo</p>
			<form action="/buscar" method="POST" class="form-inline">

				<div class="input-group">
					<input type="email" class="form-control" size="50" id="" placeholder="Nombre de restuarante, Código Postal..." >

					<div class="input-group-addon parametro-buscador" required>
						<input type="date"  name="fecha" required>
					</div>

					<div class="input-group-addon parametro-buscador">
						<select name="turno">
						  <option value="comida">Comida</option>
						  <option value="cena">Cena</option>
						</select>
					</div>

					<div class="input-group-addon parametro-buscador">
						<input type="number" name="personas" placeholder="Personas" >
					</div>

					<div class="input-group-btn">
						<button type="submit" class="btn btn-danger">Buscar</button>
					</div>
				</div>
			</form>
		</div>

		<!-- Como funciona -->
		<div class="container text-center comofunciona-div">
			<h3>CÓMO FUNCIONA</h3>
			<br>
			<!-- Parte de las imágenes -->
			<div class="row">
				<div class="col-sm-4">
					<img class="img-circle comofunciona" src="../img/comofunciona-buscar.png" alt="Como funciona">
					<p><strong>Busca tu menú</strong></p><br>
				</div>
				<div class="col-sm-4">
					<img class="img-circle comofunciona" src="../img/comofunciona-calendario.png" alt="Como funciona">
					<p><strong>Resérvalo</strong></p><br>
				</div>
				<div class="col-sm-4">
					<img class="img-circle comofunciona" src="../img/comofunciona-disfruta.png" alt="Como funciona"><br>
					<p><strong>Disfruta</strong></p><br>
				</div>
			</div>
		</div>

		<!-- Restaurantes destacados -->
		<div class="container-fluid" style="background-color:#e8e8e8">
			<div class="container container-pad	 text-center destacados">
				<h3>RESTAURANTES DESTACADOS</h3>
				<!-- Parte de las fichas de restaurantes -->
				<div class="row fichas-restaurantes">
					<div class="col-sm-6 ficha-restaurante brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
						<div class="row">
							<div class="imagen-restaurante-div img-responsive col-xs-3">
								<img class="imagen-restaurante" src="./../img/maki.gif">
							</div>
							<div class="col-xs-5">
								<h2>MAKI SUSHI POZUELO</h2><br>
								<p><em>Calle Irlanda, 38 28224</em></p><br>
								<div class="row">
									<div class="col-xs-6">
										<span class="label label-info">
											<span class="glyphicon"><i class="fa fa-beer fa-fw" aria-hidden="true"></i>&nbsp;</span>Chino
										</span>
									</div>
									<div class="col-xs-6">
										<span class="label label-info">
											<span class="glyphicon"><i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;</span>Etiq.2
										</span>
									</div>
								</div>
								<div id="stars" class="starrr"></div>
							</div>
							<div class="col-xs-4">
								<h2>MENÚ</h2>
								<h1>15 <i class="fa fa-eur" aria-hidden="true"></i></h1>
								<ul class="menu-opciones">
									<li class="menu-opciones-opcion">
										<span class="fa-stack fa-lg">
										<i class="fa fa-circle fa-stack-2x"></i>
	  									<i class="fa fa-coffe fa-stack-1x fa-inverse"></i>
										</span>
									</li>
									<li class="menu-opciones-opcion">
										<span class="fa-stack fa-lg">
										<i class="fa fa-circle fa-stack-2x"></i>
	  									<i class="fa fa-motorcycle fa-stack-1x fa-inverse"></i>
										</span>
									</li>
									<li class="menu-opciones-opcion">
										<span class="fa-stack fa-lg">
										<i class="fa fa-circle fa-stack-2x"></i>
	  									<i class="fa fa-smile-o fa-stack-1x fa-inverse"></i>
										</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
	
					<div class="col-sm-6 ficha-restaurante brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
						<div class="row">
							<div class="img-responsive col-xs-3">
								<img class="imagen-restaurante" src="./../img/goiko.svg">
							</div>
							<div class="col-xs-5">
								<h2>GOIKO GRILL POZUELO</h2><br>
								<p><em>Calle Francia, 2 28224</em></p><br>
								<div class="row">
									<div class="col-xs-6">
										<span class="label label-info">
											<span class="glyphicon"><i class="fa fa-coffee fa-fw" aria-hidden="true"></i>&nbsp;</span>Etiq.1
										</span>
									</div>
									<div class="col-xs-6">
										<span class="label label-info">
											<span class="glyphicon"><i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;</span>Etiq.2
										</span>
									</div>
								</div>
								<div id="stars" class="starrr"></div>
							</div>
							<div class="col-xs-4">
								<h2>MENÚ</h2>
								<h1>15 <i class="fa fa-eur" aria-hidden="true"></i></h1>
								<ul class="menu-opciones">
									<li class="menu-opciones-opcion">
										<span class="fa-stack fa-lg">
										<i class="fa fa-circle fa-stack-2x"></i>
	  									<i class="fa fa-coffe fa-stack-1x fa-inverse"></i>
										</span>
									</li>
									<li class="menu-opciones-opcion">
										<span class="fa-stack fa-lg">
										<i class="fa fa-circle fa-stack-2x"></i>
	  									<i class="fa fa-motorcycle fa-stack-1x fa-inverse"></i>
										</span>
									</li>
									<li class="menu-opciones-opcion">
										<span class="fa-stack fa-lg">
										<i class="fa fa-circle fa-stack-2x"></i>
	  									<i class="fa fa-smile-o fa-stack-1x fa-inverse"></i>
										</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Parte registar tu restuarante -->
		<div class="container resgistrar-restaurante">
			<a class="resgistrar-restaurante text-center" href="/registrarRestaurante">
				<h1>¿QUIÉRES REGISTRAR TU RESTAURANTE?</h1>
			</a>
		</div>

		<!-- Carousel para las experiencias de usuario -->
		<div class="container experiencias">
			<h2 class="text-center">EXPERIENCIAS DE USUARIO</h2>
			<div id="experienciasCarousel" class="carousel slide text-center" data-ride="carousel">

				<!-- Indicadores del carousel -->
				<ol class="carousel-indicators">
					<li data-target="#experienciasCarousel" data-slide-to="0" class=""></li>
					<li data-target="#experienciasCarousel" data-slide-to="1" class=""></li>
					<li data-target="#experienciasCarousel" data-slide-to="2" class="active"></li>
				</ol>

				<!-- Wrapper para las partes -->
				<div class="carousel-inner" role="listbox">
					<div class="item">
						<h4>
							"This company is the best. I am so happy with the result!"<br>
							<span style="font-style:normal;">Michael Roe, Vice President, Comment Box</span>
						</h4>
					</div>
					<div class="item">
						<h4>
							"Could I... BE any more happy with this company?"<br>
							<span style="font-style:normal;">Chandler Bing, Actor, FriendsAlot</span>
						</h4>
					</div>
					<div class="item active">
						 <h4>
						 	"One word... WOW!!"<br>
						 	<span style="font-style:normal;">John Doe, Salesman, Rep Inc</span>
						 </h4>
					</div>
				</div>
				<!-- Controles a la izquierda y la derecha -->
				<a class="left carousel-control" href="#experienciasCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				<a class="right carousel-control" href="#experienciasCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>

		<!-- Parte del Footer -->
		<jsp:include page="./footer/footer.jsp"/>
		<c:if test="${not empty login and (login == true)}" >
			<script>
				$(document).ready(function() {
					$("#login-modal").modal();
				});
			</script>
		</c:if>
	</body>
</html>