<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>MiMen�</title>

    <!-- Estilos y js Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/font-awesome-4.7.0/css/font-awesome.min.css">

    <!-- enlazo mis propios estilos -->
    <link rel="stylesheet" type="text/css" href="./css/registro-restaurante.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

    <!-- Fixed navbar Normal -->
	    <jsp:include page="./headers/header.html"></jsp:include>

    <!-- Parte del formulario de Registro -->
    <div class="container registro-restaurante">
        <form method="post" action="/registrarRestaurante" class="form-horizontal" >
            <fieldset>
                <!-- Formulario de Registro -->
                <legend class="text-center">Registra tu Restaurante</legend>

                <!-- Nombre del Restaurante -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="usuario">Restaurante</label>
                    <div class="col-md-4">
                        <input id="usuario" name="nombre" type="text" placeholder="Nombre de tu Restaurante" class="form-control input-md" required>
                    </div>
                </div>

               

                <!-- Contrase�a -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="password">Password</label>
                    <div class="col-md-4">
                        <input id="password" name="password" type="password" placeholder="Contrase�a" class="form-control input-md" required>
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

                <!-- Direcci�n�-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="direccion">Direcci�n:</label>
                    <div class="col-md-4">
                        <input id="direccion" name="direccion" type="text" placeholder="Direcci�n de tu restaurante" class="form-control input-md" required>
                    </div>
                </div>

                <!-- Tel�fono -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="telefono">Tel�fono</label>
                    <div class="col-md-4">
                        <input id="telefono" name="telefono" type="number" placeholder="Tel�fono de Contacto" class="form-control input-md" required>
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
                    <label class="col-md-4 control-label" for="delivery">�Hac�is env�os a Domicilio?</label>
                    <div class="col-md-4">
                        <div class="radio">
                            <label for="delivery-0">
                                <input type="radio" name="delivery" id="delivery-0" value="si" checked="checked">
                                S�
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

    <!-- Parte del footer -->
	<jsp:include page="./footer/footer.html"/>
    
</body>

</html>