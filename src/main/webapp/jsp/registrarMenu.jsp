<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>MiMenú</title>

		<!-- Estilos y js Bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../css/font-awesome-4.7.0/css/font-awesome.min.css">

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
		                        <c:choose><c:when test="${not empty user}"><c:out value="${user}" /></c:when><c:otherwise>No user</c:otherwise></c:choose><span class="caret"></span>
		                    </a>
		                    <ul class="dropdown-menu">
		                        <!-- Aquí iran las opciones del usuario y el botón para desconectarse -->
		                        <li>
		                            <a href="/reservas"><i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;Mis Menús</a>
		                        </li>
		                        <li>
		                            <a href="/ajustes"><i class="fa fa-cog fa-fw" aria-hidden="true"></i>&nbsp;Mis Ajustes</a>
		                        </li>
		                        <li role="separator" class="divider"></li>
		                        <li>
		                            <a href="<c:url value="${url}"/>"><i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;Desconectar</a>
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
			<h2 class="pull-left">
				Perfil
			</h2>
			<div class="clearfix"></div>

			<nav class="navbar navbar-inverse visible-xs">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Logo</a>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li class="active"><a href="#">Publicar Menú</a></li>
							<li><a href="#"><i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;Mis menús</a></li>
							<li><a href="#"><i class="fa fa-cog fa-fw" aria-hidden="true"></i>&nbsp;Ajustes</a></li>
							<li><a href="#"><i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;Desconectar</a></li>
						</ul>
					</div>
				</div>
			</nav>


			<div class="row content">
				<div class="col-sm-3 hidden-xs">
					<h2>Logo</h2>
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="#section1">Publicar Menú</a></li>
						<li><a href="#section2"><i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;Mis Menús</a></li>
						<li><a href="#section3"><i class="fa fa-cog fa-fw" aria-hidden="true"></i>&nbsp;Ajustes</a></li>
						<li><a href="#section3"><i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;Desconectar</a></li>
					</ul>
					<br>
				</div>
				<br>

				<div class="col-sm-9">
					<div class="well">
						<h3>Registrar Menú</h3>
								<form action="/registraMenu" method="post" id="fileForm" role="form">
				                    <div class="form-group">
				                        <label >Nombre del Menú</label>
				                        <input type="text" class="form-control" name="nombre" placeholder="Nombre">
				                    </div>
				                    <div class="form-group">
				                        <label >Primer Plato</label>
				                        <input type="text" class="form-control" name="1plato1" placeholder="Primer plato">
				                        <input type="text" class="form-control" name="1plato2" placeholder="Primer plato">
				                        <input type="text" class="form-control" name="1plato3" placeholder="Primer plato">
				                    </div>
				                    <div class="form-group">
				                        <label >Segundo Plato</label>
				                        <input type="text" class="form-control" name="2plato1" placeholder="Segundo plato">
				                        <input type="text" class="form-control" name="2plato2" placeholder="Segundo plato">
				                        <input type="text" class="form-control" name="2plato3" placeholder="Segundo plato">
				                    </div>
				                    <div class="form-group">
				                        <label >Postre</label>
				                        <input type="text" class="form-control" name="3plato1" placeholder="Postre">
				                        <input type="text" class="form-control" name="3plato2" placeholder="Postre">
				                        <input type="text" class="form-control" name="3plato3" placeholder="Postre">
				                    </div>
				                    <div class="form-group">
				                        <label >Precio</label>
				                        <input type="text" class="form-control" name="precio" placeholder="Precio">
				                    </div>
				                    <div class="form-group">
				                        <label >Cantidad</label>
				                        <input type="number" class="form-control" name="cantidad" placeholder="Precio">
				                    </div>
				                    <div class="form-group">
				                        <label >Fecha</label>
				                        <input type="text" class="form-control" name="fecha" placeholder="DD/MM/AAAA">
				                    </div> 
				                     <div class="form-group">
				                        <label >Turno</label>
				                        <input type="text" class="form-control" name="turno" placeholder="Turno-HH:MM">
				                    </div>
				                     <div class="form-group">
				                        <label >Categoria</label>
				                        <input type="text" class="form-control" name="categoria" placeholder="Categoría">
				                    </div>
				                    <div class="form-group">
				                        <label >Bebidas</label>
				                        <input type="text" class="form-control" name="bebida1" placeholder="Bebida1">
				                        <input type="text" class="form-control" name="bebida2" placeholder="Bebida2">
				                        <input type="text" class="form-control" name="bebida3" placeholder="Bebida3">
				                    </div>
				                    
				                    <button type="submit" class="btn btn-default">Publicar</button>
				                </form>
					</div>
				</div>
			</div>
		</div>

	</body>
</html>