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
<link rel="icon" type="image/png" href="<c:url value='/img/pvlogo.png'/>"/>
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

<title>Login</title>
</head>
<body background="img/background.jpg" style="background-size: cover;">
	<!--Header-->
	<%@include file="/WEB-INF/views/shared/header.jsp"%>
	
	<!-- Cuerpo -->
	<div style="padding-top : 150px" >
	<div class="container" style="background-color: #cf260f; padding : 50px;">
			<form:form class="form-login" method="post" modelAttribute="login" autocomplete="off">
				<center><FONT FACE="impact" SIZE=6 COLOR="white"> Formulario Login</FONT></center>
					<div class="mb-3 ">
					
						<form:input class="form-control form-control-lg" type="email" path="correo" value="" 
							placeholder="Correo" required="true"/>
					
					</div>	
					<div class="mb-3 ">
						<form:input class="form-control form-control-lg" type="password" path="contrasenia" value=""
							placeholder="Contraseña" required="true"/>
					</div>
					<div class="d-grid gap-2 col-6 mx-auto" style="padding-bottom: 10px;">
					
					
						<input class="btn btn-primary btn-lg" type="submit" name="" value="Ingresar">
					</div>
				
					<h5 align="center"><a class="nav-link"  href="<c:url value='/ChangePassword'/>">¿Olvidaste tu Contraseña?</a></h5>
				
		
	
			</form:form>
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
	<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>