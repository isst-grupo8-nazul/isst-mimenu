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
		RequestDispatcher view = request.getRequestDispatcher("jsp/restuarante/registroRestaurante.jsp");
		view.forward(request, response);
	}
%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>MiMenú</title>

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
		<jsp:include page="../headers/header-restaurante.jsp"/>

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
								Nombre Restaurante
							</div>
							<div class="profile-usertitle-job">
								Dirección
							</div>
						</div>
						<!-- END SIDEBAR USER TITLE -->
						<!-- SIDEBAR BUTTONS -->
						<div class="profile-userbuttons">
							<button type="button" class="btn btn-success btn-sm">Publicar Menú</button>
							<button type="button" class="btn btn-danger btn-sm">Logout</button>
						</div>
						<!-- END SIDEBAR BUTTONS -->
						<!-- SIDEBAR MENU -->
						<div class="profile-usermenu">
							<ul class="nav">
								<li class="active">
									<a href="#">
										<i class="fa fa-user-o fa-fw" aria-hidden="true"></i>&nbsp;
										Perfil
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-upload fa-fw" aria-hidden="true"></i>&nbsp;
										Publicar Menú
									</a>
								</li>
								<li>
									<a href="#" target="_blank">
										<i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;
										Mis Menús
									</a>
								</li>
								<li>
									<a href="#" target="_blank">
										<i class="fa fa-cog fa-fw" aria-hidden="true"></i>&nbsp;
										Mis Ajustes
									</a>
								</li>
								<li>
									<a href="#">
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

					<form method="post" action="/registrarRestaurante" class="form-horizontal" >
			            <fieldset>
			                <!-- Inofrmación del restaurante -->
			                <legend class="text-center">Tu Restaurante</legend>

			                <!-- Nombre del Restaurante -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="usuario">Restaurante</label>
			                    <div class="col-md-4">
			                        <input id="usuario" name="nombre" type="text" placeholder='<c:out value="${rest.nombre}"/>' class="form-control input-md" required>
			                    </div>
			                </div>

			                <!-- Contraseña -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="password">Password</label>
			                    <div class="col-md-4">
			                        <input id="password" name="password" type="password" placeholder="Contraseña" class="form-control input-md" required>
			                    </div>
			                </div>

			                <!-- Email -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="email">Email</label>
			                    <div class="col-md-4">
			                        <input id="email" name="email" type="email" placeholder="Email" class="form-control input-md" required>
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
			                        <input id="capacidad" name="capacidad" type="number" placeholder="Introduce a capacidad de tu restaurante" class="form-control input-md" required>
			                    </div>
			                </div>

			                <!-- Dirección´-->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="direccion">Dirección:</label>
			                    <div class="col-md-4">
			                        <input id="direccion" name="direccion" type="text" placeholder="Dirección de tu restaurante" class="form-control input-md" required>
			                    </div>
			                </div>

			                <!-- Teléfono -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="telefono">Teléfono</label>
			                    <div class="col-md-4">
			                        <input id="telefono" name="telefono" type="number" placeholder="Teléfono de Contacto" class="form-control input-md" required>
			                    </div>
			                </div>

			                <!-- Web -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="web">Web</label>
			                    <div class="col-md-4">
			                        <input id="web" name="web" type="text" placeholder="Web de tu restaurante" class="form-control input-md">
			                    </div>
			                </div>

			                <!-- Delivery -->
			                <div class="form-group">
			                    <label class="col-md-4 control-label" for="delivery">¿Hacéis envíos a Domicilio?</label>
			                    <div class="col-md-4">
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
			                    </div>
			                </div>

			                <!-- Button Registrarme -->
			                <div class="col-md-12 text-center">
			                    <input type="submit" value="Registrarme" class="btn btn-success">
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