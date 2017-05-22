
<!-- Fixed navbar Usuario Registrado-->
<nav class="navbar navbar-default navbar-fixed-top">

    <div class="container-fluid">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <!-- Poner Logo Mimen� -->
            <a id="logo" class="navbar-brand" href="/"><img src="../img/logo-blanco.png"></a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">

            <ul class="nav navbar-nav navbar-right">

                <!-- Dropdown para ver las reservas activas -->
                <li class="dropdown dropdownReservas">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        Reservas <span class="caret"></span>
                    </a>
                    <ul id="menu-rest" class="dropdown-menu">
                        <!-- Aquí iran las reservas activas del usuario y el botón para ver todas sus reservas -->
                        <!--
                        Comprobar si hay reservas
                        Si no hay reservas poner mensaje "no tienes reservas activas"
                        Si hay reservas poner todas las reservas activas (diseñar forma como se ve la reserva)
                        -->
                        <li>
                            <p class="sinReserva">
                                No tienes ninguna reserva
                            </p>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="/showReservasComensal">VER TODAS TUS RESERVAS</a>
                        </li>
                    </ul>
                </li>

                <!-- Dropdown para ver las opciones que tiene el usuario -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <!-- Insertar el nombre del usuario -->
                        ${param.nombre} <span class="caret"></span>
                    </a>
                    <ul id="menu-rest" class="dropdown-menu">
                        <!-- Aquí iran las opciones del usuario y el botón para desconectarse -->
                        <li>
                            <a href="/showReservasComensal">
                                <i class="fa fa-book fa-fw" aria-hidden="true"></i>&nbsp;
                                Mis Reservas
                            </a>
                        </li>
                        <li>
                            <a href="/login">
                                <i class="fa fa-user-o fa-fw" aria-hidden="true"></i>&nbsp;
                                Mi Perfil
                            </a>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="/logout">
                                <i class="fa fa-power-off fa-fw" aria-hidden="true"></i>&nbsp;
                                Desconectar
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="/">Ayuda</a>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>