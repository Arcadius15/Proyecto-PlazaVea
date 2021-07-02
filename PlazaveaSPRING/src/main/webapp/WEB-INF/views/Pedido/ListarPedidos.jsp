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
<title>Listar Pedidos</title>
</head>
<body background='<c:url value="img/background.jpg"/>' style="background-size: cover;">
	<%@include file="/WEB-INF/views/shared/header.jsp"%>

	<div class="container" style="padding: 20px;">
		<div class="row">
			<div class="col-md-12"
				style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh);">
				<h1 align="center">Lista de Pedidos de Delivery</h1>
				<hr>
				<div class="table-responsive" id="tblPedidos">
					<table class="table table-warning table-striped">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Cliente</th>
								<th scope="col">Dirección</th>
								<th scope="col">Fecha de compra</th>
								<th scope="col">Cantidad de Productos</th>
								<th scope="col">Estado de entrega</th>
								<th scope="col">Transportista</th>
								<th scope="col">Acciones</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="orders" items="${listOrders}">
								<tr>
									<td scope="row">${orders[0]}</td>
									<td>${orders[3]}</td>
									<td>${orders[1]}</td>
									<td>${orders[2]}</td>
									<td>${orders[6]}</td>
									<td>${orders[5]}</td>
									<c:if test="${orders[7] == null}">
										<td>Aún sin asignar</td>
									</c:if>
									<c:if test="${orders[7] != null}">
										<td>${orders[7]}</td>
									</c:if>
									<c:if test="${orders[5] == 'Pendiente'}">
										<td>
											 <button type="button" class="btn btn-success btn-sm" onclick="asignar(${orders[0]})">Asignar Transportista</button>
										</td>
									</c:if>
									<c:if test="${orders[5] != 'Pendiente'}">
										<td>
											 <button type="button" class="btn btn-info btn-sm" onclick="location.href='<c:url value="/actualizarEstado/${orders[0]}"/>'">Actualizar Estado</button>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!--Final-->
	<%@include file="/WEB-INF/views/shared/footer.jsp" %>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="js/Index.js"></script>
	<script type="text/javascript" src="js/Transportista.js"></script>
</body>
</html>