<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="es.upm.dit.isst.mimenu.model.REST" %>
<%@ page import="es.upm.dit.isst.mimenu.model.MENU" %>

<%
	HttpSession sessionOk = request.getSession();

	REST rest = (REST) sessionOk.getAttribute("userREST");

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
  		
  		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
		  		
  		<script type='text/javascript'>
	        var add = (function () {
	            var counter = 1;
	            return function () {return counter += 1;}
	        })();
	
	
	
	        function addField(){
	
	            var i = add();
	            var str = '<div class="form-group col-sm-12 col-md-12 col-lg-12 col-lg-12">\
	                                <div class="col-sm-5 col-md-5 col-lg-5 col-lg-5">\
	                                    <input id="nombrePlato" name="plato'+i+'" type="text" placeholder="Nombre del plato" class="form-control input-md" required>\
	                                </div>\
	                                <div class="col-sm-4 col-md-4 col-lg-4 col-lg-4">\
	                                    <select name="plato'+i+'" class="form-control">\
	                                        <option value="primero">Primero</option>\
	                                        <option value="segundo">Segundo</option>\
	                                        <option value="postre">Postre</option>\
	                                     </select>\
	                                </div>\
	                                <div class="col-sm-3 col-md-3 col-lg-3 col-lg-3">\
	                                    <select name="plato'+i+'" class="form-control">\
	                                        <option value="italiano">Italiano</option>\
	                                        <option value="chino">Chino</option>\
	                                        <option value="hindu">Hindú</option>\
	                                     </select>\
	                                </div>\
	                             </div>';
	
	            var child = document.createElement('div');
	            child.innerHTML = str;
	            child = child.firstChild;
	                    
	            // Container <div> where dynamic content will be placed
	            var container = document.getElementById("container");
	            
	            container.appendChild(child);
	            document.getElementById("contador").value = i;
	        }
	        
	        
	    </script>

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
							<a href="#" type="button" class="btn btn-success btn-sm">
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
								<li>
									<a href="#">
										<i class="fa fa-user-o fa-fw" aria-hidden="true"></i>&nbsp;
										Perfil
									</a>
								</li>
								<li class="active">
									<a href="#">
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

				<div class="col-sm-9">

					<form method="post" action="/registraMenu" class="form-horizontal" >
			            <fieldset>
			                <!-- Inofrmación del restaurante -->
			                <legend class="text-center">Tu Restaurante</legend>

			                <!-- Nombre del Menú -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="nombreMenu">Nombre del Menú</label>
			                    <div class="col-md-4">
			                        <input id="usuario" name="nombreMenu" type="text" class="form-control input-md" required>
			                    </div>
			                </div>

			                <!-- Platos -->
			                <div class="form-group col-sm-12 col-md-12 col-lg-12 col-lg-12">
			                    <label class="control-label">Platos</label>
			                </div>

			                <div id="container" class="form-group col-sm-12 col-md-12 col-lg-12 col-lg-12">
			                	<input type="hidden" name="contador" id="contador" value="1"/>
			                	<div class="form-group col-sm-12 col-md-12 col-lg-12 col-lg-12">
				                    <div class="col-sm-5 col-md-5 col-lg-5 col-lg-5">
				                        <input id="nombrePlato" name="plato1" type="text" placeholder="Nombre del plato" class="form-control input-md" required>
				                    </div>
				                    <div class="col-sm-4 col-md-4 col-lg-4 col-lg-4">
				                    	<select name="plato1" class="form-control">
										    <option value="primero">Primero</option>
										    <option value="segundo">Segundo</option>
										    <option value="postre">Postre</option>
										 </select>
				                    </div>
				                    <div class="col-sm-3 col-md-3 col-lg-3 col-lg-3">
				                    	<select name="plato1" class="form-control">
										    <option value="italiano">Italiano</option>
										    <option value="chino">Chino</option>
										    <option value="hindu">Hindú</option>
										 </select>
				                    </div>
				                 </div>
			                </div>
			                
			                <div id="addPlato" class="form-group col-sm-12 col-md-12 col-lg-12 col-lg-12">
			                	<a href="#" id="filldetails" onclick="event.preventDefault(); addField();"><span class="glyphicon glyphicon-plus" ></span>Añadir Plato</a>
			                </div>

			                <!-- Precio -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="precio">Precio</label>
			                    <div class="col-md-2">
			                        <input id="precio" name="precio" type="number" class="form-control input-md" min="0" step="0.01" required>
			                    </div>
			                </div>

			                
			                <!-- Cantidad -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="cantidad">Capacidad</label>
			                    <div class="col-md-2">
			                        <input id="cantidad" name="cantidad" type="number" class="form-control input-md" min="0" required>
			                    </div>
			                </div>

			                <!-- Fecha-->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="fecha">Fecha:</label>
			                    <div class="col-md-4">
			                        <input id="fecha" name="fecha" type="text" class="form-control input-md" required>
			                    </div>
			                </div>

			                <!-- Turno -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="turno">Turno</label>
			                    <div class="col-sm-3 col-md-3 col-lg-3 col-lg-3">
			                    	<select id="turno" name="turno" class="form-control">
									    <option value="comida">Comida</option>
									    <option value="cena">Cena</option>
									    
									 </select>
			                    </div>
			                </div>

			                <!-- Categoria -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="categoria">Categoria</label>
			                    <div class="col-sm-3 col-md-3 col-lg-3 col-lg-3">
			                    	<select id="categoria" name="categoria" class="form-control">
									    <option value="italiano">Italiano</option>
									    <option value="chino">Chino</option>
									    <option value="hindu">Hindú</option>
									 </select>
			                    </div>
			                </div>

			                

			                <!-- Button enviar -->
			                <div class="col-md-12 text-center">
			                    <input type="submit" value="Enviar" class="btn btn-success">
			                </div>
			            </fieldset>
			        </form>
				</div>
			</div>
		</div>

		<!-- Parte del footer -->
		<jsp:include page="../footer/footer.jsp"/>
	</body>
</html>