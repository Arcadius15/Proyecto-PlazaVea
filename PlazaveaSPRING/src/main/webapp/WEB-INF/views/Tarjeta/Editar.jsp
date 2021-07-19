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
<title>Ver Datos</title>
</head>

<body background='<c:url value="../img/background.jpg"/>' style="background-size: cover;">
	<!--Header-->
	<%@include file="/WEB-INF/views/shared/headerFindProd.jsp"%>

	<!-- Cuerpo -->
	<div class="container" style="padding: 20px;">
        <div class="row">
        	<!-- List Group -->
            <div class="col-md-3" style="background: #eef111; padding-top: 15px" >
				<div class="list-group">
				  <a href="<c:url value='/VerDatos/cliente'/>" class="list-group-item list-group-item-action" aria-current="true">
				    Datos Personales
				  </a>
				  <a href="<c:url value='/VerDireccion'/>" class="list-group-item list-group-item-action">Dirección</a>
				  <a href="<c:url value='/VerMetodoPago'/>" class="list-group-item list-group-item-action  active">Métodos de Pago</a>
				  <a href="<c:url value='/VerHistorialCompras'/>" class="list-group-item list-group-item-action">Historial de Compras</a>
				</div>
            </div>
            <!-- Formulario con Datos -->
            <div class="col-md-9" style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh); margin: auto;">
			     <div class="card bg-warning" style="margin-top: 20px;">
					<div class="card-header text-center" >
			            <h3>
			                <b>
			                    Gestionar Medotodos de Pago <i class="fa fa-credit-card" aria-hidden="true"></i>
			                </b>
			            </h3>
			        </div>
					<div class="card-body">
						<form:form method="post" modelAttribute="tarjeta">
							<form:input type="hidden" path="tarjetaId"/>
							<form:input type="hidden" path="cliente.clienteId"/>
			                <div class="mb-3 col-12">
			                  <label for="nroCTA" class="form-label">Número de Tarjeta</label>
			                  <form:input type="text" path="nroTarjeta" class="form-control" id="nroCTA" aria-describedby="PayMethod" maxlength="20" required="true"/>
			                  <div id="PayMethod" class="form-text">Debe ingresar su número de tarjeta de Débito o Crédito.</div>
			                </div>
			                <div class="mb-3 col-2">
			                  <label for="CVVinput" class="form-label">CVV</label>
			                  <form:input type="password" path="cvv" class="form-control" id="CVVinput" maxlength="3" required="true"/>
			                </div>
			                <div class="mb-3 col-4" style="padding-bottom: 20px;">
			                    <label for="ExpDate" class="form-label">Fecha de Expiración</label>
			                    <form:input type="date" path="fechavencimiento" class="form-control" id="ExpDate" required="true"/>
			                  </div>
			                <button type="submit" class="btn btn-success" style="margin-left: 15px;">Editar</button>
			              </form:form>
					</div>
				</div>
				<table class="table table-hover table-bordered table-dark" style="margin-top: 30px;">
					<thead>
						<tr>
							<th>ID</th>
							<th>Numero de Tarjeta</th>
							<th>Fecha de vencimiento</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="tarjeta" items="${bTarjetas}">
						<tr>
							<td>${tarjeta.tarjetaId}</td>
							<td>${tarjeta.nroTarjeta}</td>
							<td>${tarjeta.fechavencimiento}</td>
							<td>
								<button type="button" class="btn btn-primary btn-sm" onclick="location.href='<c:url value="/TarjetaEditar/${tarjeta.tarjetaId}"/>'">Editar</button>
								<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='<c:url value="/TarjetaEliminar/${tarjeta.tarjetaId}"/>'">Eliminar</button>
							</td>
						</tr>
					</c:forEach>

					</tbody>
				  </table>
				
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
	<script type="text/javascript" src="../js/Index.js"></script>
</html>