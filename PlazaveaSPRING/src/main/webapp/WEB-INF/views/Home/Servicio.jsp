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
<link rel="icon" type="image/png" href="<c:url value='img/pvlogo.png'/>"/>

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
			<div class="col-md-12" align="center"
				style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh);">
				<h1 class="display-1">Servicio al Cliente</h1>
				<hr>
				<div style="padding: 20px 40px 20px 40px; background: #CF260F; color: white;">
					<h2>Conoce nuestro horario de atención: </h2>
					<br>
					<h4><b>Lunes a Viernes:</b></h4> <h5>De 8 a.m. a 9 p.m.</h5> <br>
					<h4><b>Sábados y Domingos:</b></h4> <h5>De 9 a.m. a 7 p.m.</h5> <br>
					<h4><b>Feriados:</b></h4> <h5>De 10 a.m. a 6 p.m.</h5>
				</div>
				<div style="padding: 20px 40px 20px 40px; background: #FFD81B">
					<h2>Nuestros canales de atención: </h2>
					<br>
					<h4><b>Número fijo:</b></h4> <h5>(01) 5656565</h5> <br>
					<h4><b>Número móvil:</b></h4> <h5>+51999999999</h5> <br>
					<h4><b>Correo electrónico:</b></h4> <h5>plazavea@servicio.com</h5>
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
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="js/Index.js"></script>
</body>
</html>