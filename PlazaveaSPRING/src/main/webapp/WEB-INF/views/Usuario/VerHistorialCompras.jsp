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
<title>Historial de Compras</title>
</head>

<body background='<c:url value="img/background.jpg"/>' style="background-size: cover;">
	<!--Header-->
	<%@include file="/WEB-INF/views/shared/header.jsp"%>

	<!-- Cuerpo -->
	<div class="container" style="padding: 20px 20px 40px 20px;">
        <div class="row">
        	<!-- List Group -->
            <div class="col-md-3" style="background: #eef111; padding-top: 15px" >
				<div class="list-group">
				  <a href="<c:url value='/VerDatos/cliente'/>" class="list-group-item list-group-item-action">Datos Personales</a>
				  <a href="<c:url value='/VerDireccion'/>" class="list-group-item list-group-item-action">Dirección</a>
				  <a href="<c:url value='/VerMetodoPago'/>" class="list-group-item list-group-item-action">Métodos de Pago</a>
				  <a href="<c:url value='/VerHistorialCompras'/>" class="list-group-item list-group-item-action active" aria-current="true">
				  	Historial de Compras
				  </a>
				</div>
            </div>
            <!-- Historial -->
            <div class="col-md-9" style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh); margin: auto;">
                <div align="center"><FONT FACE="impact" SIZE=6 COLOR="black"> Tu Historial de Compras</FONT><div align="center">
                
                <div class="table-responsive" style="padding-top: 10px;">
                	<table class="table table-hover table-bordered">
                		<thead>
                			<tr>
                				<th>ID</th>
                				<th>Producto(s)</th>
                				<th>Fecha de Compra</th>
                				<th>Fecha de Entrega Estimada</th>
                				<th>Estado</th>
                				<th>Acción</th>
                			</tr>
                		</thead>
                		<tbody>
                			<c:forEach var="orden" items="${orden}">
                				<tr>
                					<td>${orden.ordenId}</td>
                					<c:set var="ordenDetalle" value="${orden.itemsOrdenDetalle.iterator().next()}"></c:set>
                					<td align="center">
	                					<img
											src="data:image/${typeImage};base64,${ordenDetalle.producto.getBase64Image()}"
											width="100" height="120" style="border: 0px solid; padding: 5px;" /> <br>
											${ordenDetalle.producto.nombre}<br>
										<c:if test="${orden.itemsOrdenDetalle.size() > 1}">
											<p style="color: green;">Y otro(s) ${orden.itemsOrdenDetalle.size() - 1} producto(s) más</p>
										</c:if> 
									</td>
									<td>${orden.fecha}</td>
									<td>${orden.fecha.plusDays(10)}</td>
									<td>${orden.estadoOrden.descripcion}</td>
									<td>
										<button type="button" class="btn btn-success btn-sm" onclick="location.href='<c:url value="/infoPedido/${orden.ordenId}"/>'">Más Información</button>
									</td>
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
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/Index.js"></script>
</body>
</html>