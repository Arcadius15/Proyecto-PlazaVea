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
<link rel="stylesheet" href="css/main.css" type="text/css">
<title>Página Principal</title>
</head>

<!--Header-->
<body background='<c:url value="img/background.jpg"/>' style="background-size: cover;">
	<%@include file="/WEB-INF/views/shared/header.jsp"%>

	<!--Cuerpo-->
	<div class="container" style="padding: 20px;">
		<div class="row">
			<div class="col-md-12"
				style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh);">
				<div class="row">
					<div class="col-md-12">
						<div id="OfertasCarrusel" class="carousel carousel-dark slide"
							data-bs-ride="carousel">
							<div class="carousel-inner" align="center">
								<div class="carousel-item active">
									<img src="img/oferta1.jpg" class="d-block w-100" alt="...">
								</div>
								<c:forEach var="producto" items="${bProductoCo}">
									<div class="carousel-item">
										<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
										<a href="<c:url value='/Producto/${producto.productoId}'/>">
											<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="1090px" height="605px"/>
										</a>
									</div>
								</c:forEach>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#OfertasCarrusel" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#OfertasCarrusel" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
				<div class="row" style="padding-top: 20px;">
					<div class="col-md-3">
						<div id="Categoria1" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="producto" items="${bProductoCo}">
									<c:choose>
										<c:when test="${producto == bProductoCo[0]}">
											<div class="carousel-item active">
												<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
												<a href="<c:url value='/Producto/${producto.productoId}'/>">
													<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="250px" height="125px"/>
												</a>
												<div align="center">
													<label for="exampleFormControlInput1" class="form-label" style="color: blue;"><b>${producto.nombre}</b></label> <br>
													<label for="exampleFormControlInput1" class="form-label">S/${producto.precioUnidad}</label>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="carousel-item">
												<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
												<a href="<c:url value='/Producto/${producto.productoId}'/>">
													<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="250px" height="125px"/>
												</a>
												<div align="center">
													<label for="exampleFormControlInput1" class="form-label" style="color: blue;"><b>${producto.nombre}</b></label> <br>
													<label for="exampleFormControlInput1" class="form-label">S/${producto.precioUnidad}</label>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#Categoria1" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#Categoria1" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>

						<h5 align="center">Cocina</h5>
					</div>
					<div class="col-md-3">
						<div id="Categoria2" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="producto" items="${bProductoTec}">
									<c:choose>
										<c:when test="${producto == bProductoTec[0]}">
											<div class="carousel-item active">
												<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
												<a href="<c:url value='/Producto/${producto.productoId}'/>">
													<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="250px" height="125px"/>
												</a>
												<div align="center">
													<label for="exampleFormControlInput1" class="form-label" style="color: blue;"><b>${producto.nombre}</b></label> <br>
													<label for="exampleFormControlInput1" class="form-label">S/${producto.precioUnidad}</label>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="carousel-item">
												<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
												<a href="<c:url value='/Producto/${producto.productoId}'/>">
													<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="250px" height="125px"/>
												</a>
												<div align="center">
													<label for="exampleFormControlInput1" class="form-label" style="color: blue;"><b>${producto.nombre}</b></label> <br>
													<label for="exampleFormControlInput1" class="form-label">S/${producto.precioUnidad}</label>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#Categoria2" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#Categoria2" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>

						<h5 align="center">Tecnología</h5>
					</div>
					<div class="col-md-3">
						<div id="Categoria3" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="producto" items="${bProductoJug}">
									<c:choose>
										<c:when test="${producto == bProductoJug[0]}">
											<div class="carousel-item active">
												<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
												<a href="<c:url value='/Producto/${producto.productoId}'/>">
													<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="250px" height="125px"/>
												</a>
												<div align="center">
													<label for="exampleFormControlInput1" class="form-label" style="color: blue;"><b>${producto.nombre}</b></label> <br>
													<label for="exampleFormControlInput1" class="form-label">S/${producto.precioUnidad}</label>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="carousel-item">
												<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
												<a href="<c:url value='/Producto/${producto.productoId}'/>">
													<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="250px" height="125px"/>
												</a>
												<div align="center">
													<label for="exampleFormControlInput1" class="form-label" style="color: blue;"><b>${producto.nombre}</b></label> <br>
													<label for="exampleFormControlInput1" class="form-label">S/${producto.precioUnidad}</label>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#Categoria3" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#Categoria3" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>

						<h5 align="center">Juguetes</h5>
					</div>
					<div class="col-md-3">
						<div id="Categoria4" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="producto" items="${bProductoBel}">
									<c:choose>
										<c:when test="${producto == bProductoBel[0]}">
											<div class="carousel-item active">
												<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
												<a href="<c:url value='/Producto/${producto.productoId}'/>">
													<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="250px" height="125px"/>
												</a>
												<div align="center">
													<label for="exampleFormControlInput1" class="form-label" style="color: blue;"><b>${producto.nombre}</b></label> <br>
													<label for="exampleFormControlInput1" class="form-label">S/${producto.precioUnidad}</label>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="carousel-item">
												<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
												<a href="<c:url value='/Producto/${producto.productoId}'/>">
													<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="250px" height="125px"/>
												</a>
												<div align="center">
													<label for="exampleFormControlInput1" class="form-label" style="color: blue;"><b>${producto.nombre}</b></label> <br>
													<label for="exampleFormControlInput1" class="form-label">S/${producto.precioUnidad}</label>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#Categoria4" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#Categoria4" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>

						<h5 align="center">Belleza</h5>
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
</body>
</html>