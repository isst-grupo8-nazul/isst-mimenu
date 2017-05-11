<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>MiMenú</title>

		<!-- Estilos y js Bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../css/font-awesome-4.7.0/css/font-awesome.min.css">

		<!-- enlazo mis propios estilos -->
		<link rel="stylesheet" type="text/css" href="../css/perfil-restaurante.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	</head>

	<body>

		<!-- Fixed navbar Restaurante Registrado-->
		<jsp:include page="./headers/header-restaurante.jsp"/>

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

					<h3>Personal info</h3>
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-lg-3 control-label">First name:</label>
							<div class="col-lg-8">
								<input class="form-control" value="Jane" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">Last name:</label>
							<div class="col-lg-8">
								<input class="form-control" value="Bishop" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">Company:</label>
							<div class="col-lg-8">
								<input class="form-control" value="" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">Email:</label>
							<div class="col-lg-8">
								<input class="form-control" value="janesemail@gmail.com" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">Time Zone:</label>
							<div class="col-lg-8">
								<div class="ui-select">
									<select id="user_time_zone" class="form-control">
										<option value="Hawaii">(GMT-10:00) Hawaii</option>
										<option value="Alaska">(GMT-09:00) Alaska</option>
										<option value="Pacific Time (US & Canada)">(GMT-08:00) Pacific Time (US & Canada)</option>
										<option value="Arizona">(GMT-07:00) Arizona</option>
										<option value="Mountain Time (US & Canada)">(GMT-07:00) Mountain Time (US & Canada)</option>
										<option value="Central Time (US & Canada)" selected="selected">(GMT-06:00) Central Time (US & Canada)</option>
										<option value="Eastern Time (US & Canada)">(GMT-05:00) Eastern Time (US & Canada)</option>
										<option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Username:</label>
							<div class="col-md-8">
								<input class="form-control" value="janeuser" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Password:</label>
							<div class="col-md-8">
								<input class="form-control" value="11111122333" type="password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Confirm password:</label>
							<div class="col-md-8">
								<input class="form-control" value="11111122333" type="password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label"></label>
							<div class="col-md-8">
								<input class="btn btn-primary" value="Save Changes" type="button">
								<span></span>
								<input class="btn btn-default" value="Cancel" type="reset">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Parte del footer -->
		<jsp:include page="./footer/footer.jsp"/>
	</body>
</html>