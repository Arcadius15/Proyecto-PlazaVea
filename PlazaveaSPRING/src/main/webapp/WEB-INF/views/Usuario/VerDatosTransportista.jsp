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
<title>Ver Datos</title>
</head>

<body background='<c:url value="../img/background.jpg"/>' style="background-size: cover;">
	<!--Header-->
	<%@include file="/WEB-INF/views/shared/headerFindProd.jsp"%>

	<!-- Cuerpo -->
	<div class="container" style="padding: 20px;">
        <div class="row">
        	<!-- List Group -->
            <div class="col-md-3" style="background: #eef111; padding-top: 15px" >
				<div class="list-group">
				  <a href="<c:url value='/VerDatos'/>" class="list-group-item list-group-item-action active" aria-current="true">
				    Datos Personales
				  </a>
				</div>
            </div>
            <!-- Formulario con Datos -->
            <div class="col-md-9" style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh); margin: auto;">
                <form:form class="form-login" method="post" modelAttribute="usuarioData" accept-charset="utf-8">
					<center><FONT FACE="impact" SIZE=6 COLOR="black"> Datos Personales - ${sessionScope.usuario.nombre}</FONT></center>
						<form:input path="transportistaId" type="hidden"/>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px; padding-top: 10px">
							<label for="exampleFormControlInput1" class="form-label">Nombre:</label>
							<form:input class="form-control form-control-lg" type="text" path="nombre" value="${sessionScope.usuario.nombre}"
								placeholder="Ingrese un Nombre"/>
						</div>	
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Apellido:</label>
							<form:input class="form-control form-control-lg" type="text" path="apellido" value="${sessionScope.usuario.apellido}"
								placeholder="Ingrese un Apellido"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">DNI:</label>
							<form:input class="form-control form-control-lg" type="number" path="dni" value="${sessionScope.usuario.dni}"
								placeholder="Ingrese un DNI"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Nro. Placa del Camión:</label>
							<form:input class="form-control form-control-lg" type="text" path="placaCamion" value="${sessionScope.usuario.placaCamion}"
								placeholder="Placa Camión" readonly="true"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Centro de Transporte:</label>
							<form:input class="form-control form-control-lg" type="text" path="centroTransporte" value="${sessionScope.usuario.centroTransporte}"
								placeholder="Centro Transporte" readonly="true"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Turno:</label>
							<form:input class="form-control form-control-lg" type="text" path="turno" value="${sessionScope.usuario.turno}"
								placeholder="Turno" readonly="true"/>
						</div>
						<hr>
						<form:input path="userTransportista.usuarioId" type="hidden"/>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Correo Electrónico:</label>
							<form:input class="form-control form-control-lg" type="email" path="userTransportista.correo" value="${sessionScope.usuario.userTransportista.correo}"
								placeholder="Ingrese un Correo" readonly="true"/>
						</div>
						<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
							<label for="exampleFormControlInput1" class="form-label">Contraseña:</label>
							<form:input class="form-control form-control-lg" type="password" path="userTransportista.contrasenia" value="${sessionScope.usuario.userTransportista.contrasenia}"
								placeholder="Ingrese una Contraseña"/>
						</div>
						<div class="d-grid gap-2 col-6 mx-auto">
							<input class="btn btn-primary btn-lg" type="submit" name="" value="Guardar Cambios">
						</div>
				</form:form>
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
	<script type="text/javascript" src="../js/Index.js"></script>
</body>
</html>