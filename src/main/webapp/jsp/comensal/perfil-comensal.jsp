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

	COMENSAL comensal = (COMENSAL) sessionOk.getAttribute("userCOMENSAL");

	List<MENU> menus = (List<MENU>) sessionOk.getAttribute("menusCOMENSAL");
	List<PLATO> platos = (List<PLATO>) sessionOk.getAttribute("platosCOMENSAL");
	List<REST> rests = (List<REST>) sessionOk.getAttribute("restsCOMENSAL");

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
							<img src="./../../img/user.png" class="img-responsive" alt="">
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
							<a href="/showReservasComensal" type="button" class="btn btn-success btn-sm">
								<i class="fa fa-book fa-fw" aria-hidden="true"></i>&nbsp;
								Mis Reservas
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
									<a href="/login">
										<i class="fa fa-user-o fa-fw" aria-hidden="true"></i>&nbsp;
										Mi Perfil
									</a>
								</li>
								<li id="publicar-menu">
									<a href="/showReservasComensal">
										<i class="fa fa-book fa-fw" aria-hidden="true"></i>&nbsp;
										Mis Reservas
									</a>
								</li>
								<li id="mis-ajustes">
									<a href="/">
										<i class="fa fa-search fa-fw" aria-hidden="true"></i>&nbsp;
										Buscar Menús
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

				<div id="perfil" class="col-sm-9">

					<form method="post" action="/actualizarComensal" class="form-horizontal" >
			            <fieldset>
			                <!-- Formulario de Registro -->
			                <legend class="text-center"><%= nombre %></legend>

			                <!-- Nombre y apellidos -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="usuario">Nombre y Apellidos</label>
			                    <div class="col-md-4">
			                        <input id="usuario" name="nombre" type="text" value="<%= nombre %>" class="form-control input-md">
			                    </div>
			                </div>

			                <!-- Contraseña -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="password">Nueva Contraseña</label>
			                    <div class="col-md-4">
			                        <input id="password" name="password" type="password" placeholder="Nueva Contraseña..." class="form-control input-md">
			                    </div>
			                </div>

			                <!-- Email -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="email">Email</label>
			                    <div class="col-md-4">
			                        <input id="email" name="email" type="email" value="<%= email %>" class="form-control input-md" readonly>
			                    </div>
			                </div>

			                <!-- Dirección-->
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