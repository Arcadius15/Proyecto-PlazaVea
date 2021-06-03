<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Página Principal</title>
</head>

<!--Header-->
<body background='<c:url value="../img/background.jpg"/>' style="background-size: cover;">
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #cf260f;">
		<div class="container-fluid">
			<a class="navbar-brand" href="<c:url value='/Index'/>"> <img src='<c:url value="../img/vea2.png"/>' alt=""
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
					<li class="nav-item"><a class="nav-link" href="<c:url value='/Index'/>">Página
							Principal</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Categorías </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Supermercado</a></li>
							<li><a class="dropdown-item" href="#">Tecnología</a></li>
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
					
					<c:choose>
						<c:when test="${sessionScope.usuario == null}">
							<ul class="navbar-nav ml-auto p-2">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">
										<i class="far fa-user"></i> Mi usuario
								</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="<c:url value='/Login'/>"><i
												class="fas fa-user-circle"></i> Iniciar Sesión</a></li>
										<li><a class="dropdown-item" href="<c:url value='/Registro'/>"><i
												class="fas fa-address-card"></i> Registrar</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#"><i
												class="fas fa-archive"></i> Gestionar Pedido</a></li>
									</ul></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="navbar-nav ml-auto p-2">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">
										<i class="far fa-user"></i> Bienvenido <b>${sessionScope.usuario.nombre}!</b>
								</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="<c:url value='/VerDatos'/>"><i
												class="fas fa-user-circle"></i> Ver Datos Personales </a></li>
										<li><a class="dropdown-item" href="<c:url value='/Logout'/>"><i
												class="fas fa-address-card"></i> Cerrar Sesión </a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#"><i
												class="fas fa-archive"></i> Gestionar Pedido</a></li>
									</ul></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="d-flex">
					<input class="form-control me-1 " type="text"
						placeholder="Buscar Productos" id="btnBuscar" autocomplete="off">
					<button type="button" class="btn btn-primary btn-sm" onclick='buscar()'>Buscar</button>
				</div>
			</div>
		</div>
	</nav>
	
	
	<!-- Cuerpo -->
	<div class="container" style="padding: 20px;">
        <div class="row">
            <div class="col-md-3" style="background: #eef111;" >
				<form style="padding-bottom: 20px; padding-top: 10px;">
					<input class="form-control me-2" type="search"
						placeholder="Buscar Productos" aria-label="Search">
				</form>
                <div class="accordion" id="accordionPanelsStayOpenExample">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                          Proveedor
                        </button>
                      </h2>
                      <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                        <div class="accordion-body">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Proveedor1">
                                <label class="form-check-label" for="Proveedor1">
                                  Proveedor 1
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Proveedor2">
                                <label class="form-check-label" for="Proveedor2">
                                  Proveedor 2
                                </label>
                              </div>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="true" aria-controls="panelsStayOpen-collapseTwo">
                          Categoria
                        </button>
                      </h2>
                      <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingTwo">
                        <div class="accordion-body">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Categoria1">
                                <label class="form-check-label" for="Categoria1">
                                  Categoria1
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Categoria2" >
                                <label class="form-check-label" for="Categoria2">
                                    Categoria2
                                </label>
                              </div>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="true" aria-controls="panelsStayOpen-collapseThree">
                          Precio
                        </button>
                      </h2>
                      <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingThree">
                        <div class="accordion-body">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Precio1">
                                <label class="form-check-label" for="Precio1">
                                    Precio1
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Precio2">
                                <label class="form-check-label" for="Precio2">
                                    Precio2
                                </label>
                              </div>
                        </div>
                      </div>
                    </div>
                  </div>

            </div>
            <div class="col-md-9" style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh); margin: auto;">
                <table id="example" class="table table-hover" style="width:100%;background-color: #cf260f;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Descripcion</th>
                            <th>Imagen</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="producto" items="${bProducto}">
									<tr>
										<td>${producto.productoId}</td>
										<td>${producto.nombre}</td>
										<td>${producto.precioUnidad}</td>
										<td>${producto.stock}</td>
										<td>${producto.descripcion}</td>
										<td>
											<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
											<a href="<c:url value='/Producto/${producto.productoId}'/>">
												<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="280px" height="150px"/>
											</a>
										</td>
									</tr>
								</c:forEach>
                    </tbody>
                </table>
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
					class="fab fa-facebook"></i> Facebook</a></li>
			<li class="nav-item"><a class="nav-link text-reset"
				href="https://www.instagram.com/plazavea.oficial" target="_blank"><i
					class="fab fa-instagram"></i> Instagram</a></li>
			<li class="nav-item"><a class="nav-link text-reset"
				href="https://twitter.com/plazavea" target="_blank"><i
					class="fab fa-twitter"></i> Twitter</a></li>
		</ul>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="../js/Index.js"></script>
</body>


</html>