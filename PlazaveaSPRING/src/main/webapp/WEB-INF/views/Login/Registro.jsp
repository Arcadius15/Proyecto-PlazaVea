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

<title>Registrarse</title>
</head>
<body>
	<!--Header-->
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #cf260f;">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img src="img/vea2.png" alt=""
				width="85" height="45">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item active"><a class="nav-link" href="#">Pagina
							Principal</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Categorias </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Supermercado</a></li>
							<li><a class="dropdown-item" href="#">Tecnologia</a></li>
							<li><a class="dropdown-item" href="#">Hogar</a></li>
							<li><a class="dropdown-item" href="#">Muebles</a></li>
							<li><a class="dropdown-item" href="#">Deporte</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Lista de Marcas</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#">Ofertas</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Lanzamientos</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Servicio
							al Cliente</a></li>
				</ul>


				<div class="collapse navbar-collapse d-flex"
					id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto p-2">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="far fa-user"></i> Mi usuario
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#"><i
										class="fas fa-user-circle"></i> Iniciar Sesion</a></li>
								<li><a class="dropdown-item" href="#"><i
										class="fas fa-address-card"></i> Registrar</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#"><i
										class="fas fa-archive"></i> Gestionar Pedido</a></li>
							</ul></li>
					</ul>
				</div>
				<form class="d-flex">
					<input class="form-control me-2" type="search"
						placeholder="Buscar Productos" aria-label="Search">
				</form>
			</div>
		</div>
	</nav>
	
	<form:form class="form-login" method="post" modelAttribute="cliente">
		<h5>Registrar Usuario</h5>
		
		<form:input class="controls" type="text" path="userCliente.correo" value=""
			placeholder="Correo"/>
		<form:input class="controls" type="password" path="userCliente.contrasenia" value=""
			placeholder="Contraseña"/>
			
		<p></p>
		
		<form:input class="controls" type="text" path="nombre" value=""
			placeholder="Nombre"/>
		<form:input class="controls" type="text" path="apellido" value=""
			placeholder="Apellido"/>
		<form:input class="controls" type="number" path="dni" value=""
			placeholder="DNI"/>
		<form:input class="controls" type="text" path="telefono" value=""
			placeholder="Número telefónico"/>
			
		<input class="buttons" type="submit" name="" value="Registrar">
		
		<p></p>
	</form:form>
	
	<p></p>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
	<footer th:fragment="footer" class="text-right text-white fixed-bottom"
		style="background-color: #ae1500;">
		<div class="container">
			<p>Plaza Vea &copy 2021</p>
		</div>
	</footer>
</body>
</html>