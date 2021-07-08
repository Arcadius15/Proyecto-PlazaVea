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
	
<title>Cambiar Contraseña</title>
</head>
<body background="img/background.jpg" style="background-size: cover;">

	<!--Header-->
	
	<%@include file="/WEB-INF/views/shared/header.jsp"%>
	
	<!-- Cuerpo  -->
	<div style="padding-top : 150px" >
		<div class="container" style="background-color: #cf260f; padding : 50px;">
		
				<form:form   class="form-login" id="formulario"  method="post" modelAttribute="login">
				
					<center><FONT FACE="impact" SIZE=6 COLOR="white"> Cambiar Contraseña</FONT></center>
					
						<div class="mb-3 ">
							<form:input class="form-control form-control-lg" type="number" path="usuarioId" placeholder="ID" required="true"/>
						</div>	
						<div class="mb-3">	
							<form:input class="form-control form-control-lg" type="email" path="correo" placeholder="Correo" required="true"/>
							
						</div>	
						<div class="mb-3 ">	
							<form:input class="form-control form-control-lg" id="pass1" type="password" path="contrasenia" placeholder="Contraseña" required="true"/>
						</div>	
						<div class="mb-3 ">	
							<input class="form-control form-control-lg" id="pass2" type="password" name="confPass" placeholder="Confirmar Contraseña" required="required"/>
						</div>		
						
						<div class="d-grid gap-2 col-6 mx-auto">
							
							<button type="submit" onclick=" return validar()" class="btn btn-primary btn-lg">Cambiar</button>
						</div>
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
	<script t src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript" src="js/Index.js"></script>
	<script type="text/javascript" src="js/ValidarContra.js"></script>
	
</body>
</html>