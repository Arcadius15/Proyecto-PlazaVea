<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>Información de Pedido</title>
</head>
<body background="../img/background.jpg" style="background-size: cover;">
	<!-- Inicio -->
	<%@include file="/WEB-INF/views/shared/headerFindProd.jsp"%>

	<!-- Cuerpo -->
	<div class="container" style="padding: 20px;">
		<div class="row">
			<div class="col-md-12"
				style="background: #fff; padding: 15px 55px 15px 20px; min-height: calc(100vh);">
				<h1 align="center">Información de Compra</h1>
				<h6 align="center">ID de Orden: ${orden.ordenId}</h6>
				<div class="row" style="padding-top: 20px;">
					<div class="col-md-8">
						<h5 align="center">${estadoOrden}</h5>
						<input type="hidden" id="estadoActual" value="${orden.estadoOrden.estadoId}">
						<div class="progress">
						  <div class="progress-bar progress-bar-striped ${animado}" role="progressbar" style="width: ${estadoPorcentaje}%" aria-valuenow="${estadoPorcentaje}" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<c:if test="${orden.fechaEntrega != null}">
							<p align="center"><b>Entregado el: </b>${orden.fechaEntrega}</p>
						</c:if>
						<div class="card" style="margin-top: 25px;">
							  <div class="card-body">
							  		<h6><b>Dirección de Entrega:</b> ${orden.direccion}</h6>
							  		<h6><b>Fecha de compra:</b> ${orden.fecha}</h6>
							  		<h6><b>Fecha estimada de entrega:</b> ${orden.fecha.plusDays(10)}</h6>
							  		<c:if test="${orden.transportista == null}">
							  			<h6><b>Transportista:</b> Aún sin Asignar</h6>
							  		</c:if>
							  		<c:if test="${orden.transportista != null}">
							  			<h6><b>Transportista:</b> ${orden.transportista.nombre} ${orden.transportista.apellido}</h6>
							  		</c:if>
							  </div>
						</div>
						<div class="table-responsive" style="padding-top: 20px;">
							  	<table class="table table-striped table-bordered">
							  		<thead>
							  			<tr>
							  				<th>Producto</th>
							  				<th>Cantidad</th>
							  				<th>Precio por unidad</th>
							  				<th>Descuento</th>
							  				<th>Precio Total</th>
							  			</tr>
							  		</thead>
							  		<tbody>
							  			<c:forEach var="ordenDetalle" items="${orden.itemsOrdenDetalle}">
							  				<tr align="center">
							  					<td>
							  						<img
													src="data:image/${typeImage};base64,${ordenDetalle.producto.getBase64Image()}"
													width="100" height="120" style="border: 0px solid; padding: 5px;" /> <br>
													${ordenDetalle.producto.nombre}
							  					</td>
							  					<td style="vertical-align: middle;">${ordenDetalle.cantidad}</td>
							  					<td style="vertical-align: middle;">s/${ordenDetalle.producto.precioUnidad}</td>
							  					<td style="vertical-align: middle;">s/${ordenDetalle.descuento}</td>
							  					<td style="vertical-align: middle;">s/${ordenDetalle.precio}</td>
							  				</tr>
							  				<c:set var="total" value="${total = total + ordenDetalle.precio}"/>
							  			</c:forEach>
							  		</tbody>
							  		<tfoot align="center">
							  			<tr>
							  				<td colspan="5"><b>SubTotal:</b> s/${total}</td>
							  			</tr>
							  			<tr>
							  				<td colspan="5"><b>Impuesto:</b> s/${orden.impuesto}</td>
							  			</tr>
							  			<tr>
							  				<td colspan="5"><b>Monto Total:</b> s/${total + orden.impuesto}</td>
							  			</tr>
							  		</tfoot>
							  	</table>
							  </div>
					</div>
					<c:if test="${sessionScope.userType == 't'}">
						<div class="col-md-4">
							<div class="card">
							  <div class="card-body">
								<form:form method="post" modelAttribute="orden" id="actualizarEstado" accept-charset="utf-8">
									<form:input type="hidden" path="ordenId"/>
									<form:input type="hidden" path="direccion"/>
									<form:input type="hidden" path="impuesto"/>
									<form:input type="hidden" path="tarjeta"/>
									<form:input type="hidden" path="fecha"/>
									<form:input type="hidden" path="cliente.clienteId"/>
									<form:input type="hidden" path="transportista.transportistaId"/>
									<label for="Estado" class="form-label">Actualizar Estado de Orden</label>
				                    <form:select path="estadoOrden.estadoId" class="form-select form-select-sm" id="Estado">
										<form:options items="${estados}" itemValue="estadoId" itemLabel="descripcion"/>
									</form:select>
									<c:if test="${orden.fechaEntrega == null && orden.estadoOrden.estadoId != 9}">
										<div align="center" style="padding-top: 20px;">
											<form:button class="btn btn-success btn-sm" type="button" onclick="actualizar()">Actualizar</form:button>
										</div>
									</c:if>
									<c:if test="${orden.fechaEntrega != null || orden.estadoOrden.estadoId == 9}">
										<div align="center" style="padding-top: 20px;">
											<form:button class="btn btn-success btn-sm" type="button" disabled="true">Actualizar</form:button>
										</div>
									</c:if>
								</form:form>
							  </div>
							</div>
							<div align="center" style="padding-top: 15px;">
								<button class="btn btn-primary btn-md" onclick="location.href='<c:url value="/ListDelivery"/>'">Volver al Listado</button>
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.userType == 'c'}">
						<div class="col-md-4">
							<div align="center" style="padding-top: 20px;">
								<button class="btn btn-primary btn-md" onclick="location.href='<c:url value="/VerHistorialCompras"/>'">Volver al Historial de Compras</button>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<!--Final-->
	<%@include file="/WEB-INF/views/shared/footer.jsp" %>
	
	<script src="../js/Carrito.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="../js/Index.js"></script>
	<script type="text/javascript" src="../js/Pedido.js"></script>
</body>
</html>