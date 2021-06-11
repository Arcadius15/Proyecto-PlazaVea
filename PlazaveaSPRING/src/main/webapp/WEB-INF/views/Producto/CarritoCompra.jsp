<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Carrito de Compra</title>
</head>
<body background='<c:url value="img/background.jpg"/>'
	style="background-size: cover;">
	<!--Header-->
	<%@include file="/WEB-INF/views/shared/header.jsp"%>

	<!-- Cuerpo -->
	<div class="container" style="padding: 20px;">
		<div class="row">
			<div class="col-md-8"
				style="background-color: #ffff; padding: 15px 20px 15px 20px; min-height: calc(70vh); margin: auto;">
				<div class="accordion" id="accordionCompra">
					<div class="accordion-item">
						<h2 class="accordion-header" id="panelCarrito">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#CarritoCompra"
								aria-expanded="true" aria-controls="CarritoCompra">
								Carrito de Compra</button>
						</h2>
						<div id="CarritoCompra" class="accordion-collapse collapse show"
							aria-labelledby="panelCarrito">
							<div class="accordion-body">
								<table class="table table-dark table-hover"
									style="color: #cf260f;">
									<thead>
										<tr>
											<td style="font-style: italic;">Producto</td>
											<td>Precio Unidad</td>
											<td>Cantidad</td>
											<td>Stock Disponible</td>
											<td>Precio Total</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>aea</td>
											<td>aea</td>
											<td><input type="number" min="1" max="20"
												class="form-control form-control-sm"
												style="max-width: 80px;"></td>
											<td>aea</td>
											<td>1313</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="panelFormaPago">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#FormaPago"
								aria-expanded="false" aria-controls="FormaPago">Forma
								de Pago</button>
						</h2>
						<div id="FormaPago" class="accordion-collapse collapse"
							aria-labelledby="panelFormaPago">
							<div class="accordion-body">
								<label for="Payment" class="form-label">Seleccionar
									Metodo de Pago</label> <select class="form-select form-select-sm"
									id="Payment">
									<option selected>Seleccione Tarjeta</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select> <a href="#" class="btn btn-warning btn-sm"
									style="margin-top: 15px;">Agregar Metodo de Pago</a>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="panelDireccion">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#Direccion"
								aria-expanded="false" aria-controls="Direccion">
								Direccion de envio</button>
						</h2>
						<div id="Direccion" class="accordion-collapse collapse"
							aria-labelledby="panelDireccion">
							<div class="accordion-body">
								<label for="NewDireccion" class="form-label">Entregar
									Compra a la Siguiente direccion:</label> <input
									class="form-control form-control-sm" type="text"
									id="NewDireccion" readonly> <a href="#"
									class="btn btn-warning btn-sm" style="margin-top: 15px;">Cambiar
									Direccion</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4"
				style="background-color: rgb(95, 223, 45); padding: 15px 20px 15px 20px; min-height: calc(70vh); margin: auto;">
				<div class="card text-center">
					<div class="card-header">Datos del Cliente</div>
					<div class="card-body">
						<h5 class="card-title">Datos Personales</h5>
						<p class="card-text">With supporting text below as a natural
							lead-in to additional content.</p>
						<button type="submit" class="btn btn-success">Confirmar</button>
						<button type="button" class="btn btn-danger">Cancelar</button>
					</div>
					<div class="card-footer text-muted">
						Total de Compra :
						<h4>
							<strong>396.96</strong>
						</h4>
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
	<script type="text/javascript" src="js/Index.js"></script>
</body>
</html>