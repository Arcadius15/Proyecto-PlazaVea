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

<title>Informacion del Producto</title>
</head>
<body background="../img/background.jpg" style="background-size: cover;">
	<!-- Inicio -->
	<%@include file="/WEB-INF/views/shared/header.jsp"%>

	<!-- Cuerpo -->
	<div style="padding-top: 100px">
		<div class="container text-center"
			style="background-color: #cf260f; padding: 50px;">

			<div class="card bg-warning border-ligth mb-3"
				style="max-width: 10500px;">
				<div class="row g-0">
					<div class="col-md-5">
						<img
							src="data:image/${typeImage};base64,${producto.getBase64Image()}"
							width="300" height="360" style="border: 0px solid; padding: 10px" />
					</div>
					<div class="col-md-6">
						<div class="card-body">
							<br>
							<h3 class="card-title">Informacion del Producto</h3>
							<form:form name="" method="post" modelAttribute="producto"
								enctype="multipart/form-data">


								<p style="font-size: 15pt">
									Nombre: &nbsp <span>${producto.nombre }</span><br>
								</p>
								<p style="font-size: 15pt">
									Precio por Unidad: &nbsp<span>S./
										${producto.precioUnidad }0</span>
								</p>
								<p style="font-size: 15pt">
									Stock Disponible: &nbsp<span>${producto.stock} unidades</span>
								</p>
								<p style="font-size: 15pt">
									Descripción: &nbsp<span>${producto.descripcion }</span>
								</p>
								<br>
								<div class="btn-group" role="group"
									aria-label="Basic mixed styles example">
									<button type="submit" class="btn btn-primary active">Añadir
										a Carrito</button>
									<button type="button"
										onclick="location.href='<c:url value="#"/>'"
										class="btn btn-danger">Cancelar</button>

								</div>

							</form:form>
						</div>
					</div>
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
</html>