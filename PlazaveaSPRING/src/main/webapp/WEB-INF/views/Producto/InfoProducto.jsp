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
		<nav class="navbar navbar-expand-lg navbar-dark"
				style="background-color: #cf260f;">
				
				<div class="container-fluid">
					<a class="navbar-brand" href="#"> <img src="../img/vea2.png" alt=""
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
							<li class="nav-item"><a class="nav-link" href="#">Servicio al Cliente</a></li>
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
	
	
	<div style="padding-top : 100px"  >
	<div class="container text-center" style="background-color: #cf260f; padding : 50px; height 500px;">
	
	<div class="card bg-warning border-ligth mb-3" style="max-width: 10500px;">
  <div class="row g-0">
    <div class="col-md-5">
      <img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="300" height="360"
							style="border: 0px solid; padding : 10px "/>
    </div>
    <div class="col-md-6">
      <div class="card-body">
      <br>
        <h3 class="card-title">Informacion del Producto</h3>
        <form:form name="" method="post" modelAttribute="producto" enctype="multipart/form-data">
        
       
        <p style=" font-size: 15pt" >Nombre:  &nbsp <span>${producto.nombre }</span><br></p>
        <p style=" font-size: 15pt" >Precio por Unidad: &nbsp<span>S./ ${producto.precioUnidad }0</span> </p>
        <p style=" font-size: 15pt" > Stock Disponible: &nbsp<span>${producto.stock} unidades</span></p>
        <p style=" font-size: 15pt" >Descripci�n: &nbsp<span>${producto.descripcion }</span></p>
        <br>
        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
			  <button type="submit" class="btn btn-primary active">A�adir a Carrito</button>
			  <button type="button" onclick="location.href='<c:url value="#"/>'"class="btn btn-danger">Cancelar</button>
			  
</div>
        
        </form:form>
      </div>
    </div>
  </div>
</div>
	</div>
	</div>
<!--Final-->
	<footer class="text-white fixed-bottom"
		style="background-color: #cf260f;">
		<ul class="nav text-left">
			<li class="nav-item"><a class="nav-link text-reset disabled"
				href="#">Plaza Vea Copyright &copy; <script>
					document.write(new Date().getFullYear())
				</script>
			</a></li>
			<li class="nav-item"><a class="nav-link text-reset"
				href="https://www.facebook.com/plazaVeaOficial/" target="_blank"><i
					class="fab fa-facebook"></i>Facebook</a></li>
			<li class="nav-item"><a class="nav-link text-reset"
				href="https://www.instagram.com/plazavea.oficial" target="_blank"><i
					class="fab fa-instagram"></i>Instagram</a></li>
			<li class="nav-item"><a class="nav-link text-reset"
				href="https://twitter.com/plazavea" target="_blank"><i
					class="fab fa-twitter"></i>Twitter</a></li>
		</ul>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
</body>
</html>