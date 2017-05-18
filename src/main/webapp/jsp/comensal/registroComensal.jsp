<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <link rel="stylesheet" type="text/css" href="../../css/registro-restaurante.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

    <!-- Fixed navbar Normal -->
	<jsp:include page="../headers/header.jsp"></jsp:include>

    <!-- Parte del formulario de Registro -->
    <div class="container registro-restaurante">
        <form method="post" action="/registrarComensal" class="form-horizontal" >
            <fieldset>
                <!-- Formulario de Registro -->
                <legend class="text-center">Registrate</legend>

                <!-- Nombre y apellidos -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="usuario">Nombre y Apellidos</label>
                    <div class="col-md-4">
                        <input id="usuario" name="nombre" type="text" placeholder="Tu nombre y apellidos" class="form-control input-md" required>
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
                        <input id="email" name="email" type="email" placeholder="Tu email" class="form-control input-md" required>
                    </div>
                </div>
        

                <!-- Dirección-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="direccion">Dirección:</label>
                    <div class="col-md-4">
                        <input id="direccion" name="direccion" type="text" placeholder="Tu dirección para entrega de pedidos" class="form-control input-md" required>
                    </div>
                </div>

                <!-- Teléfono -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="telefono">Teléfono</label>
                    <div class="col-md-4">
                        <input id="telefono" name="telefono" type="number" placeholder="Tu teléfono" class="form-control input-md" required>
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
	<jsp:include page="../footer/footer.jsp"/>
    
</body>

</html>