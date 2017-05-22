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
<%@ page import="java.text.DecimalFormat" %>

<%
	System.out.println("He llegado al inicio de pagoReserva.jsp");
	HttpSession sessionOk = request.getSession();

	COMENSAL comensal = (COMENSAL) sessionOk.getAttribute("userCOMENSAL");

	MENU menu = (MENU) sessionOk.getAttribute("menu");
	PLATO[] platos = (PLATO[]) sessionOk.getAttribute("platos");
	String bebida = (String) sessionOk.getAttribute("bebida");
	REST rest = (REST) sessionOk.getAttribute("rest");

	if (comensal == null) {
		RequestDispatcher viewer = request.getRequestDispatcher("jsp/comensal/registroComensal.jsp");
		viewer.forward(request, response);
	}

	DecimalFormat df = new DecimalFormat("####.##");
	String sb = df.format(menu.getPrecio() * 0.79);
	String iva = df.format(menu.getPrecio() * 0.21);

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

  		<style>
			#ticket ul {
			    list-style-type: none;
			    margin: 0px;
			    padding: 10px 10px 0px 0px;
			}
			#showMenus .tags a{text-decoration: none; border:1px solid #DDD;display:inline-block;color:#717171;background:#FFF;-webkit-box-shadow:0 1px 1px 0 rgba(180,180,180,0.1);box-shadow:0 1px 1px 0 rgba(180,180,180,0.1);-webkit-transition:all .1s ease-in-out;-moz-transition:all .1s ease-in-out;-o-transition:all .1s ease-in-out;-ms-transition:all .1s ease-in-out;transition:all .1s ease-in-out;border-radius:2px;margin:0 3px 6px 0;padding:5px 10px}
			#showMenus .tags a.success{cursor:default; text-decoration: none; color:#FFF;background-color:#5CB85C;border-color:#4CAE4C}
			#showMenus .tags a.primary{color:#FFF;background-color:#428BCA;border-color:#357EBD}
			/* CSS for Credit Card Payment form */
			.credit-card-box .panel-title {
			    display: inline;
			    font-weight: bold;
			}
			.credit-card-box .form-control.error {
			    border-color: red;
			    outline: 0;
			    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(255,0,0,0.6);
			}
			.credit-card-box label.error {
			  font-weight: bold;
			  color: red;
			  padding: 2px 8px;
			  margin-top: 2px;
			}
			.credit-card-box .payment-errors {
			  font-weight: bold;
			  color: red;
			  padding: 2px 8px;
			  margin-top: 2px;
			}
			.credit-card-box label {
			    display: block;
			}
			/* The old "center div vertically" hack */
			.credit-card-box .display-table {
			    display: table;
			}
			.credit-card-box .display-tr {
			    display: table-row;
			}
			.credit-card-box .display-td {
			    display: table-cell;
			    vertical-align: middle;
			    width: 50%;
			}
			/* Just looks nicer */
			.credit-card-box .panel-heading img {
			    min-width: 180px;
			}
		</style>

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
								<li id="perfil">
									<a href="/login">
										<i class="fa fa-user-o fa-fw" aria-hidden="true"></i>&nbsp;
										Mi Perfil
									</a>
								</li>
								<li id="publicar-menu" class="active">
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

				<div id="ticket" class="col-sm-9 col-md-9 col-lg-9">

					<div class="container-fluid">
					    <div class="row">
					        <div class="well col-xs-10 col-sm-10 col-md-6 col-lg-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
					            <div class="row">
					                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					                    <address>
					                        <strong><%= rest.getNombre() %></strong>
					                        <br>
					                        <%= rest.getDireccion() %>
					                        <br>
					                        <abbr title="Telefono">T:</abbr> <%= rest.getTelefono() %>
					                    </address>
					                </div>
					                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
					                    <p>
					                        <em><%= menu.getFecha() %></em>
					                    </p>
					                    <p>
					                        <em>Recibo #: 34522677W</em>
					                    </p>
					                </div>
					            </div>
					            <div class="row">
					                <div class="text-center">
					                    <h1>Recibo</h1>
					                </div>
					                </span>
					                <table class="table table-hover">
					                    <thead>
					                        <tr>
					                            <th>Menu</th>
					                            <th>Cant</th>
					                            <th class="text-center">Precio</th>
					                            <th class="text-center">Total</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                        <tr>
					                            <td class="col-md-9">
					                            	<%= menu.getNombre() %>
					                            	<ul>
					                            		<% for(PLATO plato : platos){%>
					                            			<li><em><%= plato.getNombre() %></em></li>
					                            		<% } %>
					                            		<li><em><%= bebida %></em></li>
					                            	</ul>
					                            </td>
					                            <td class="col-md-1" style="text-align: center"> 1 </td>
					                            <td class="col-md-1 text-center"><%= menu.getPrecio() %>€</td>
					                            <td class="col-md-1 stext-center"><%= menu.getPrecio() %>€</td>
					                        </tr>

					                        <tr>
					                            <td>   </td>
					                            <td>   </td>
					                            <td class="text-right">
						                            <p>
						                                <strong>Subtotal: </strong>
						                            </p>
						                            <p>
						                                <strong>IVA: </strong>
						                            </p>
					                            </td>

					                            <td class="text-center">
						                            <p>
						                                <strong><%= sb %>€</strong>
						                            </p>
						                            <p>
						                                <strong><%= iva %>€</strong>
						                            </p>
					                            </td>
					                        </tr>
					                        <tr>
					                            <td>   </td>
					                            <td>   </td>
					                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
					                            <td class="text-center text-danger"><h4><strong><%= menu.getPrecio() %>€</strong></h4></td>
					                        </tr>
					                    </tbody>
					                </table>

					                <div class="panel panel-default credit-card-box">
						                <div class="panel-heading display-table" >
						                    <div class="row display-tr" >
						                        <h3 class="panel-title display-td" >Detalles del pago</h3>
						                        <div class="display-td" >
						                            <img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
						                        </div>
						                    </div>
						                </div>
						                <div class="panel-body">
					                        <div class="row">
					                            <div class="col-xs-12">
					                                <div class="form-group">
					                                    <label for="cardNumber">NÚMERO DE TARJETA</label>
					                                    <div class="input-group">
					                                        <input
					                                            type="tel"
					                                            class="form-control"
					                                            name="cardNumber"
					                                            placeholder="Número de tarjeta válido"
					                                            autocomplete="cc-number"
					                                            required autofocus 
					                                        />
					                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-xs-7 col-md-7">
					                                <div class="form-group">
					                                    <label for="cardExpiry"><span class="hidden-xs">FECHA</span><span class="visible-xs-inline">FECHA</span> DE EXPIRACIÓN</label>
					                                    <input
					                                        type="tel"
					                                        class="form-control"
					                                        name="cardExpiry"
					                                        placeholder="MM / AA"
					                                        autocomplete="cc-exp"
					                                        required
					                                    />
					                                </div>
					                            </div>
					                            <div class="col-xs-5 col-md-5 pull-right">
					                                <div class="form-group">
					                                    <label for="cardCVC">CÓDIGO CV</label>
					                                    <input
					                                        type="tel"
					                                        class="form-control"
					                                        name="cardCVC"
					                                        placeholder="CVC"
					                                        autocomplete="cc-csc"
					                                        required
					                                    />
					                                </div>
					                            </div>
					                        </div>

					                        <div class="row" style="display:none;">
					                            <div class="col-xs-12">
					                                <p class="payment-errors"></p>
					                            </div>
					                        </div>
						                </div>
						            </div>
						            <!-- CREDIT CARD FORM ENDS HERE -->
					                <form action="/reservaMenu" method="post">
									    <input type="submit" class="btn btn-success btn-lg btn-block" value="Pagar y reservar" />
									</form>
					            </div>
					        </div>
					    </div>
					</div>
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