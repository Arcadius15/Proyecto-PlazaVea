<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Producto</h3>
	
	<a href="<c:url value='/home'/>">Index</a>
	<a href='<c:url value="#"/>'>Registrar</a>
	<br><br>
	<div>
		<form:form name="" method="post" modelAttribute="producto" enctype="multipart/form-data">
			Id: <form:input type="number" path="productoId" readonly="true"/><br>
			Nombre: <form:label type="text" path="nombre"/><br>
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
	


</body>
</html>