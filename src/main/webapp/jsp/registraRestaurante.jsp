<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
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
		<link rel="stylesheet" type="text/css" href="./css/landing.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	</head>
	<body>

		<!-- Fixed navbar Normal -->
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
	          <a class="navbar-brand" href="/"><img src="./img/logo-blanco.png"></a>
	        </div>

	        <div id="navbar" class="navbar-collapse collapse">
	          <ul class="nav navbar-nav navbar-right">
	            <li>
	              <a href="/resgistrar_restaurante">Registra Tu Restaurante</a>
	            </li>
	            <li>
	              <a href="/login">Inicia Sesión</a>
	            </li>
	            <li class="active">
	              <a href="/registrate">Regístrate</a>
	            </li>
	            <li>
	              <a href="/ayuda">Ayuda</a>
	            </li>
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </nav>
	    
	    <div>
	    
	    <h3>Registrar Menú</h3>
			<form action="/registraRest" method="post" id="fileForm" role="form">
		                 <div class="form-group">
		                     <label >Email</label>
		                     <input type="email" class="form-control" name="email" placeholder="Email">
		                 </div>
		                 
		                 <div class="form-group">
		                     <label >Nombre</label>
		                     <input type="text" class="form-control" name="nombre" placeholder="Nombre">
		                 </div>
		                 
		                 <div class="form-group">
		                     <label >Capacidad</label>
		                     <input type="number" class="form-control" name="capacidad" placeholder="Capacidad">
		                 </div>
		                 
		                 <div class="form-group">
		                     <label >Contraseña</label>
		                     <input type="password" class="form-control" name="password" placeholder="password">
		                 </div>
		                 
		                 <div class="form-group">
		                     <label >Dirección</label>
		                     <input type="text" class="form-control" name="direccion" placeholder="direccion">
		                 </div>
		                 
		                 <div class="form-group">
		                     <label >Teléfono</label>
		                     <input type="number" class="form-control" name="telefono" placeholder="Teléfono">
		                 </div>
		                 
		                 <div class="form-group">
		                     <label >Logo</label>
		                     <input type="text" class="form-control" name="logo" placeholder="URL del logo">
		                 </div>
		                 
		                 <div class="form-group">
		                     <label >Web</label>
		                     <input type="text" class="form-control" name="web" placeholder="URL Web">
		                 </div>
		                 
		                 
		                
		                 
		                 <button type="submit" class="btn btn-default">Registrar</button>
		             </form>
	    
	    
	    
	    
	    
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