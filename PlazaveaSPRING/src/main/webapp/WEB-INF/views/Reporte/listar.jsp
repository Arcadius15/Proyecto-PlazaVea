<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Lista de Reportes</title>
</head>
<body background="img/background.jpg" style="background-size: cover;">
	<!--Header-->
	<%@include file="/WEB-INF/views/shared/header.jsp"%>
	
	<!-- Cuerpo -->
	<div class="container" style="padding: 20px;">
		<div class="row">
			<div class="col-md-12"
				style="background: #fff; padding: 20px 25px 20px 25px; min-height: calc(100vh);">
				<h1 align="center">Listado de Reportes</h1>
				<h6 align="center">sobre el funcionamiento del sistema</h6>
				<hr>
				<div class="row" style="padding-top: 20px;">
					<div class="col-md-9">
						<div class="table-responsive">
							<table class="table table-striped table-bordered">
								<c:forEach var="reporte" items="${listReporte}">
									<thead>
										<tr>
											<td rowspan="2" width="3%"><b>ID:</b> ${reporte.reporteId}</td>
											<td><b>Título:</b> ${reporte.titulo}</td>
										</tr>
										<tr>
											<td><b>Autor:</b> ${reporte.transportista.nombre} ${reporte.transportista.apellido}</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2">"${reporte.comentario}"</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
					<div class="col-md-3" align="center">
						<button class="btn btn-primary btn-md" onclick="location.href='<c:url value="/reporte_registrar"/>'">Registrar un Reporte</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Final -->
	<%@include file="/WEB-INF/views/shared/footer.jsp" %>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/Index.js"></script>
</body>
</html>