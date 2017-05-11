<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>MiMenú</title>

		<!-- Estilos y js Bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="./css/font-awesome-4.7.0/css/font-awesome.min.css">

		<!-- enlazo mis propios estilos -->
		<link rel="stylesheet" type="text/css" href="./css/perfil-restaurante.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	</head>

	<body>

		<!-- Fixed navbar Restaurante Registrado-->
		<nav class="navbar navbar-default navbar-fixed-top">

		    <div class="container-fluid">

		        <div class="navbar-header">
		            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            </button>

		            <!-- Poner Logo Mimenú -->
	         		<a class="navbar-brand" href="/">
	         			<img src="./img/logo-blanco.png">
					</a>
		        </div>

		        <div id="navbar" class="navbar-collapse collapse">

		            <ul class="nav navbar-nav navbar-right">

		                <li>
		                    <a href="/menus/publicar">Publicar Menú</a>
		                </li>

		                <!-- Dropdown para ver las opciones que tiene el restaurante -->
		                <li class="dropdown">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		                        <!-- Insertar el nombre del usuario -->
		                        Nombre Restaurante <span class="caret"></span>
		                    </a>
		                    <ul class="dropdown-menu">
		                        <!-- Aquí iran las opciones del usuario y el botón para desconectarse -->
		                        <li>
		                            <a href="/reservas">
		                            	<i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;
		                            	Mis Menús
		                            </a>
		                        </li>
		                        <li>
		                            <a href="/ajustes"><i class="fa fa-cog fa-fw" aria-hidden="true"></i>&nbsp;Mis Ajustes</a>
		                        </li>
		                        <li role="separator" class="divider"></li>
		                        <li>
		                            <a href="/reservas"><i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;Desconectar</a>
		                        </li>
		                    </ul>
		                </li>

		                <li>
		                    <a href="/ayuda">Ayuda</a>
		                </li>
		            </ul>
		        </div><!--/.nav-collapse -->
		    </div>
		</nav>

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

				<div class="col-md-9">
		            <div class="profile-content">
					   Some user related content goes here...
		            </div>
				</div>
			</div>
		</div>

		<!-- Parte del footer -->

	    <footer>

	        <!-- Primera parte con ciudades, descubre y suscripciones -->
	        <div class="container-fluid nonavbar">

	            <hr>
	            <div class="row">
	                <div class="col-md-4 footer-ciudades">
	                    <h3>CIUDADES</h3>
	                    <a href="/"><p>Madrid</p></a>
	                    <a href="/"><p>Valencia</p></a>
	                    <a href="/"><p>Barcelona</p></a>
	                    <a href="/"><p>Bilbao</p></a>
	                </div>
	                <div class="col-md-4 footer-conoce-mimenu">
	                    <h3>DESCUBRE MI MENÚ</h3>
	                    <a href="/"><p>Quiénes Somos</p></a>
	                    <a href="/"><p>Cómo Funciona</p></a>
	                    <a href="/"><p>Preguntas Frecuentes</p></a>
	                    <a href="/"><p>Términos y condiciones</p></a>
	                    <a href="/"><p>Contacto</p></a>
	                </div>

	                <div class="col-md-4">
	                    <h3>SUSCRÍBETE A NUESTRA NEWSLETTER</h3>
	                    <div class="input-group">
	                        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email" required>

	                        <div class="input-group-btn">
	                            <button type="button" class="btn btn-success">Suscribirme</button>
	                        </div>
	                    </div>
	                </div>
	            </div>

	            <hr>

	            <!-- Parte del footer con iconos sociales -->
	            <div class="row text-center">
	                <h3>SÍGUENOS</h3>
	                <div class="col-md-12">
	                    <ul class="social-network social-circle">
	                        <li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
	                        <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
	                        <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
	                        <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
	                        <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </footer>

	</body>
</html>