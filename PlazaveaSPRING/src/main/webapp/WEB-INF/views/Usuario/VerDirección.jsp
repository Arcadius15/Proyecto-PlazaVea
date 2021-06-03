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
<title>Ver Direcci�n</title>
</head>

<body background='<c:url value="img/background.jpg"/>' style="background-size: cover;">
	<!--Header-->
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #cf260f;">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img src='<c:url value="img/vea2.png"/>' alt=""
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
												class="fas fa-user-circle"></i> Iniciar Sesion</a></li>
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
										<i class="far fa-user"></i> Bienvenido ${sessionScope.usuario.nombre} !
								</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="<c:url value='/VerDatos'/>"><i
												class="fas fa-user-circle"></i> Ver Datos Personales </a></li>
										<li><a class="dropdown-item" href="<c:url value='/Logout'/>"><i
												class="fas fa-address-card"></i> Cerrar Sesi�n </a></li>
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
        	<!-- List Group -->
            <div class="col-md-3" style="background: #eef111; padding-top: 15px" >
				<div class="list-group">
				  <a href="<c:url value='/VerDatos'/>" class="list-group-item list-group-item-action" aria-current="true">Datos Personales</a>
				  <a href="<c:url value='/VerDirecci�n'/>" class="list-group-item list-group-item-action active">
				  	Direcci�n
				  </a>
				  <a href="<c:url value='/VerMetodoPago'/>" class="list-group-item list-group-item-action">M�todos de Pago</a>
				</div>
            </div>
            <!-- Direcci�n -->
            <div class="col-md-9" style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh); margin: auto;">
                
                <c:choose>
                	<c:when test="${sessionScope.usuario.direccion == null}">
                		<div class="card">
						  <div class="card-body">
						    <p class="card-text">No se ha a�adido ninguna direcci�n.</p>
						  </div>
						</div>
                	</c:when>
                	<c:otherwise>
                		<div class="card">
						  <div class="card-body">
						  	<h5 class="card-title">Direcci�n:</h5>
						    <p class="card-text">${sessionScope.usuario.direccion}</p>
						  </div>
						</div>
                	</c:otherwise>
                </c:choose>
                <hr>
                <form class="form-login" name = "" method="post" accept-charset="utf-8">
                	<c:choose>
	                	<c:when test="${sessionScope.usuario.direccion == null}">
	                		<center><FONT FACE="impact" SIZE=6 COLOR="black">Registrar Direcci�n</FONT></center>
	                	</c:when>
	                	<c:otherwise>
	                		<center><FONT FACE="impact" SIZE=6 COLOR="black">Editar Direcci�n</FONT></center>
	                	</c:otherwise>
	                </c:choose>
						<input name="clienteId" type="hidden" value="${sessionScope.usuario.clienteId}"/>
						
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px; padding-top: 10px">
							<label for="exampleFormControlInput1" class="form-label">Pa�s:</label>
							<input class="form-control form-control-lg" name="pais" type="text" placeholder="Ingrese un Pa�s"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Departamento:</label>
							<input class="form-control form-control-lg" name="departamento" type="text" placeholder="Ingrese un Departamento"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Distrito:</label>
							<input class="form-control form-control-lg" name="distrito" type="text" placeholder="Ingrese un Distrito"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Avenida:</label>
							<input class="form-control form-control-lg" name="avenida" type="text" placeholder="Ingrese una Avenida"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Calle y N�mero:</label>
							<input class="form-control form-control-lg" name="calle" type="text" placeholder="Ingrese una Calle con N�mero de Casa"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Referencia:</label>
							<input class="form-control form-control-lg" name="referencia" type="text" placeholder="Ingrese una Referencia"/>
						</div>
						
						<c:choose>
		                	<c:when test="${sessionScope.usuario.direccion == null}">
		                		<div class="d-grid gap-2 col-6 mx-auto">
									<input class="btn btn-primary btn-lg" type="submit" name="" value="Registrar Direcci�n">
								</div>
		                	</c:when>
		                	<c:otherwise>
		                		<div class="d-grid gap-2 col-6 mx-auto">
									<input class="btn btn-primary btn-lg" type="submit" name="" value="Editar Direcci�n">
								</div>
		                	</c:otherwise>
		                </c:choose>				
				</form>
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
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/Index.js"></script>
</body>
</html>