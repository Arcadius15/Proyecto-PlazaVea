<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/Main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="js/Index.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<title>Página Principal</title>
</head>
<body>
	<header class="header">
		<nav class="navbar navbar-expand-sm navbar-dark"
			style="background-color: #ae1500;">
			<a class="navbar-brand" href="<c:url value='/Index'/>"> <img src="img/vea2.png" alt=""
				width="85" height="45">
			</a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="<c:url value='/Index'/>"><b>Página Principal</b></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Buscar por Categoria </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Supermercado</a></li>
							<li><a class="dropdown-item" href="#">Tecnologia</a></li>
							<li><a class="dropdown-item" href="#">Hogar</a></li> <br>
							<li><a class="dropdown-item" href="#">Muebles</a></li>
							<li><a class="dropdown-item" href="#">Deporte</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Lista de Marcas</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/Login'/>">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/Registro'/>">Registrarse</a></li>
				</ul>
			</div>
		</nav>
	</header>
	
	<div align="center">
		<table id="tblProductos" class="table table-danger table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>Nombre de Producto</th>
                <th>Precio por Unidad</th>
                <th>Stock</th>
                <th>Descripcion</th>
                <th>Imagen</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="producto" items="${bProducto}">
				<tr>
					<td>
						<a href="<c:url value='/Producto/${producto.productoId}'/>">
							<b>${producto.nombre}</b>
						</a>
					</td>
					<td>
						${producto.precioUnidad}
					</td>
					<td>
						${producto.stock}
					</td>
					<td>
						${producto.descripcion}
					</td>
					<td>
						<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }"/>
							<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" 
								width="160" height="130" style="border: 5px solid; color: black;"/>
					</td>
				</tr>
			</c:forEach>
         </tbody>
        <tfoot>
            <tr>
                <th>Nombre de Producto</th>
                <th>Precio por Unidad</th>
                <th>Stock</th>
                <th>Descripcion</th>
                <th>Imagen</th>
            </tr>
        </tfoot>
				
		</table>
	</div>
	
	<footer th:fragment="footer" class="text-right text-white fixed-bottom"
		style="background-color: #ae1500;">
		<div class="container">
			<p>Plaza Vea &copy 2021</p>
		</div>
	</footer>
</body>
</html>