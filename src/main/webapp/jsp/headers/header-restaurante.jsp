<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                        <img src="../img/logo-blanco.png">
                    </a>
                </div>

                <div id="navbar" class="navbar-collapse collapse">

                    <ul class="nav navbar-nav navbar-right">

                        <li>
                            <a href="/registraMenu">Publicar Menú</a>
                        </li>

                        <!-- Dropdown para ver las opciones que tiene el restaurante -->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <!-- Insertar el nombre del usuario -->
                                ${param.nombre} <span class="caret"></span>
                            </a>
                            <ul id="menu-rest" class="dropdown-menu">
                                <!-- Aquí iran las opciones del usuario y el botón para desconectarse -->
                                <li>
                                    <a href="/showMenusRest"><i class="fa fa-cutlery fa-fw" aria-hidden="true"></i>&nbsp;Mis Menús</a>
                                </li>
                                <li>
                                    <a href="/ajustes"><i class="fa fa-cog fa-fw" aria-hidden="true"></i>&nbsp;Mis Ajustes</a>
                                </li>
                                <li role="separator" class="divider"></li>
                                <li>
                                    <a href="/logout"><i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;Desconectar</a>
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