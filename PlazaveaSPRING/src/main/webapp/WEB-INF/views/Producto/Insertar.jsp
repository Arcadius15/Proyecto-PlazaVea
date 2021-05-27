<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Producto - Registrar!</h3>
	<form:form name="" method="post" modelAttribute="producto" enctype="multipart/form-data">
		Nombre: <form:input type="text" path="nombre"/><br>
		Precio: <form:input type="number" path="precioUnidad"/><br>
		stock: <form:input type="number" path="stock"/><br>
		Descripcion: <form:input type="text" path="descripcion"/><br>
		
		Seleccione Imagen: <br>
		<input type="file" name="picture" accept="image/jpeg, image/png"/> <br><br>
		Categoria:
		<form:select path="categoria.categoriaId">
			<form:options items="${Categorias}" itemValue="categoriaId" itemLabel="nombre"/>
		</form:select> <br>
		Proveedor:
		<form:select path="proveedor.proveedorId">
			<form:options items="${Proveedores}" itemValue="proveedorId" itemLabel="nombre"/>
		</form:select> <br>
		<button type="submit">Guardar</button>
		<button type="button" onclick="location.href='<c:url value="/Index"/>'">Cancelar</button>
	</form:form>

</body>
</html>