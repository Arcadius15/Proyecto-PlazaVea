<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/Login.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
	
<title>Registro Exitoso</title>
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
						aria-current="page" href="<c:url value='/Index'/>">Página Principal</a></li>
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
	
	<br><br><br>
	<h1 align="center"><b>Registro Exitoso</b></h1>
	
	<br><br><br>
	<h4 align="center"><a class="nav-link" href="<c:url value='/Login'/>">Inicie Sesión Ahora</a></h4> <br><br><br>
	
	<footer th:fragment="footer" class="text-right text-white fixed-bottom"
		style="background-color: #ae1500;">
		<div class="container">
			<p>Plaza Vea &copy 2021</p>
		</div>
	</footer>
</body>
</html>