<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/Main.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
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
		<table>
				<% int count = 0; %>
				<c:forEach var="producto" items="${bProducto}">
					<th>
						<p>      
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</p><br>
						<a href="#"><b>${producto.nombre}</b></a> <br>
						${producto.precioUnidad}
					</th>
					<% count += 1;
						if(count == 5){
					%>
							<tr>
					<%
							count = 0;
						}
					%>
				</c:forEach>
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