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
<title>Insert title here</title>
</head>
<body background="img/background.jpg" >
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

	<h3>Producto</h3>
	
	<a href="<c:url value='/home'/>">Index</a>
	<a href='<c:url value="#"/>'>Registrar</a>
	<br><br>
	<div>
		<form:form name="" method="post" modelAttribute="producto" enctype="multipart/form-data">
			Id: <form:input type="number" path="productoId" readonly="true"/><br>
			Nombre: <form:input type="text" path="nombre"/><br>
			Precio por Unidad: <form:input type="number" path="precioUnidad"/><br>
			Stock Disponible: <form:input type="text" path="stock"/><br>
			Descripcion: <form:input type="text" path="descripcion"/><br>
			<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.')}"/>
				<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="190" height="160"
						style="border: 3px solid; color: black;"/>
			<button type="submit">Añadir a Carrito</button>
			<button type="button" onclick="location.href='<c:url value="/listar_aerolinea"/>'">Cancelar</button>
		</form:form>
	</div>
	<div>
	
	
	</div>
	

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
</body>
</html>