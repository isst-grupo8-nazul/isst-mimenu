<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="es.upm.dit.isst.mimenu.model.REST" %>
<%@ page import="es.upm.dit.isst.mimenu.model.MENU" %>
<%@ page import="es.upm.dit.isst.mimenu.model.PLATO" %>

<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>

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
	
	String logo = rest.getLogo();
%>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
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
							<img src="/serve-image?blob-key=<%= logo %>" class="img-responsive" alt="">
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
								<li id="perfil" class="active">
									<a href="/loginrest">
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
								<li id="mis-menus">
									<a href="/showMenusRest">
										<i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;
										Mis Menús
									</a>
								</li>
								<li id="mis-ajustes">
									<a href="#" target="_blank">
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

				<div class="col-sm-9">

					<form method="post" action="/actualizarRestaurante" class="form-horizontal" >
			            <fieldset>
			                <!-- Inofrmación del restaurante -->
			                <legend class="text-center"><%= nombre %></legend>

			                <!-- Nombre del Restaurante -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="usuario">Nombre</label>
			                    <div class="col-md-4">
			                        <input id="usuario" name="nombre" type="text" value="<%= nombre %>" class="form-control input-md">
			                    </div>
			                </div>

			                <!-- Contraseña -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="password">Contraseña</label>
			                    <div class="col-md-4">
			                        <input id="password" name="password" type="text" placeholder="Nueva Contraseña..." class="form-control input-md">
			                    </div>
			                </div>

			                <!-- Email -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="email">Email</label>
			                    <div class="col-md-4">
			                        <input id="email" name="email" type="email" value="<%= email %>" class="form-control input-md" readonly>
			                    </div>
			                </div>

			                <!-- Logo del Restaurante
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="logo-restaurante">Logo Restaurante</label>
			                    <div class="col-md-4">
			                        <input id="logo-restaurante" name="logo-restaurante" class="input-file" type="file">
			                    </div>
			                </div>-->

			                <!-- Capacidad del Restaurante -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="capacidad">Capacidad</label>
			                    <div class="col-md-2">
			                        <input id="capacidad" name="capacidad" type="number" value="<%= capacidad %>" class="form-control input-md">
			                    </div>
			                </div>

			                <!-- Dirección´-->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="direccion">Dirección:</label>
			                    <div class="col-md-4">
			                        <input id="direccion" name="direccion" type="text" value="<%= direccion %>" class="form-control input-md">
			                    </div>
			                </div>

			                <!-- Teléfono -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="telefono">Teléfono</label>
			                    <div class="col-md-4">
			                        <input id="telefono" name="telefono" type="number" value="<%= telefono %>" class="form-control input-md">
			                    </div>
			                </div>

			                <!-- Web -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="web">Web</label>
			                    <div class="col-md-4">
			                        <input id="web" name="web" type="text" value="<%= web %>" class="form-control input-md">
			                    </div>
			                </div>

			                <!-- Delivery -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="delivery">Envíos a Domicilio</label>
			                    <div class="col-md-4">
			                    <% if (delivery == "si") { %>
			                        <div class="radio">
			                            <label for="delivery-0">
			                                <input type="radio" name="delivery" id="delivery-0" value="si" checked="checked">
			                                Sí
			                            </label>
			                        </div>
			                        <div class="radio">
			                            <label for="delivery-1">
			                                <input type="radio" name="delivery" id="delivery-1" value="no">
			                                No
			                            </label>
			                        </div>
			                    <%} else { %>
			                    	<div class="radio">
			                            <label for="delivery-0">
			                                <input type="radio" name="delivery" id="delivery-0" value="si">
			                                Sí
			                            </label>
			                        </div>
			                        <div class="radio">
			                            <label for="delivery-1">
			                                <input type="radio" name="delivery" id="delivery-1" value="no" checked="checked">
			                                No
			                            </label>
			                        </div>
			                    <% } %>
			                    </div>
			                </div>

			                <!-- Button Actualizar -->
			                <div class="col-md-12 text-center">
			                    <input type="submit" value="Actualizar" class="btn btn-success">
			                </div>
			            </fieldset>
			        </form>
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