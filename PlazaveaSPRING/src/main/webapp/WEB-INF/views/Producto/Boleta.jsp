<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="<c:url value='/img/pvlogo.png'/>"/>
<!--BootsTrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<!--Font Awensome-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--Data Table-->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" href="css/main.css" type="text/css">
<title>Carrito de Compra</title>
</head>
<body background='<c:url value="img/background.jpg"/>'
	style="background-size: cover;">
	<!--Header-->
	<%@include file="/WEB-INF/views/shared/header.jsp"%>

	<!-- Cuerpo -->
    <div class="container" style="padding: 20px;">
        <div class="row">
            <div class="col-md-12"
                style="background: #fff; padding: 15px 20px 15px 20px; margin: auto;">
                <div class="card text-center" style="width: auto; height: 650px; padding: auto; margin: auto;">
                    <div class="card-body">
                      <h5 class="card-title">Orden Nro: ${orden.ordenId}</h5>
                      <h6 class="card-subtitle mb-2 text-muted">Fecha de compra: ${orden.fecha} <b>/</b> Fecha de Entrega: ${orden.fechaEntrega}</h6>
                      <p class="card-text">
                        <span style="font-family: Verdana;">
                            <b>
                                Nombre de Cliente: ${orden.cliente.nombre}<br>
                                Numero de Contacto: ${orden.cliente.telefono}<br>
                                Direccion de Envio: ${orden.direccion}<br>
                                Correo: ${orden.cliente.userCliente.correo}<br>
                            </b>
                        </span>
                        <table class="table table-success table-striped">
                            <thead>
                                <tr>
                                    <th>Producto</th>
                                    <th>Precio Unidad</th>
                                    <th>Cantidad</th>
                                    <th>Descuento</th>
                                    <th>Precio</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="item" items="${listado}">
                            		<tr>
                            			<td>${item.producto.nombre}</td>
                            			<td>${item.producto.precioUnidad}</td>
                            			<td>${item.cantidad}</td>
                            			<td>${item.descuento}</td>
                            			<td>${item.precio}</td>
                            		</tr>
                            		<c:set var="total" value="${total = total + item.precio}"/>
                            	</c:forEach>
                                
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2" >Impuesto: S/. ${orden.impuesto}</td>
                                    <td colspan="3" >Monto Total con Impuesto: S/. ${total + orden.impuesto}</td>
                                </tr>
                            </tfoot>
                        </table>
                      </p>
                      <a href='<c:url value="/Index"/>' class="card-link">Volver al Inicio</a>
                      <a href='<c:url value="#"/>' class="card-link">Ver Historial de Compras</a>
                    </div>
                  </div>

            </div>
        </div>
    </div>


	<!--Final-->
	<%@include file="/WEB-INF/views/shared/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="js/Index.js"></script>
	<script type="text/javascript" src="js/VerCarrito.js"></script>
</body>
</html>