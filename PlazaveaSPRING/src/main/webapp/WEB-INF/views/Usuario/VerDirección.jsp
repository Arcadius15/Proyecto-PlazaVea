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
<title>Ver Dirección</title>
</head>

<body background='<c:url value="img/background.jpg"/>' style="background-size: cover;">
	<!--Header-->
	<%@include file="/WEB-INF/views/shared/header.jsp"%>

	<!-- Cuerpo -->
	<div class="container" style="padding: 20px 20px 40px 20px;">
        <div class="row">
        	<!-- List Group -->
            <div class="col-md-3" style="background: #eef111; padding-top: 15px" >
				<div class="list-group">
				  <a href="<c:url value='/VerDatos/cliente'/>" class="list-group-item list-group-item-action" aria-current="true">Datos Personales</a>
				  <a href="<c:url value='/VerDireccion'/>" class="list-group-item list-group-item-action active">
				  	Dirección
				  </a>
				  <a href="<c:url value='/VerMetodoPago'/>" class="list-group-item list-group-item-action">Métodos de Pago</a>
				  <a href="<c:url value='/VerHistorialCompras'/>" class="list-group-item list-group-item-action">Historial de Compras</a>
				</div>
            </div>
            <!-- Dirección -->
            <div class="col-md-9" style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh); margin: auto;">
                
                <c:choose>
                	<c:when test="${sessionScope.usuario.direccion == null}">
                		<div class="card">
						  <div class="card-body">
						    <p class="card-text">No se ha añadido ninguna dirección.</p>
						  </div>
						</div>
                	</c:when>
                	<c:otherwise>
                		<div class="card">
						  <div class="card-body">
						  	<h5 class="card-title">Dirección:</h5>
						    <p class="card-text">${sessionScope.usuario.direccion}</p>
						  </div>
						</div>
                	</c:otherwise>
                </c:choose>
                <hr>
                <form class="form-login" name = "" method="post" accept-charset="utf-8">
                	<c:choose>
	                	<c:when test="${sessionScope.usuario.direccion == null}">
	                		<center><FONT FACE="impact" SIZE=6 COLOR="black">Registrar Dirección</FONT></center>
	                	</c:when>
	                	<c:otherwise>
	                		<center><FONT FACE="impact" SIZE=6 COLOR="black">Editar Dirección</FONT></center>
	                	</c:otherwise>
	                </c:choose>
						
						<c:choose>
		                	<c:when test="${sessionScope.usuario.direccion == null}">
		                		<input name="clienteId" type="hidden" value="${sessionScope.usuario.clienteId}"/>
						
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px; padding-top: 10px">
									<label for="exampleFormControlInput1" class="form-label">País:</label>
									<input class="form-control form-control-lg" name="pais" type="text" placeholder="Ingrese un País" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Departamento:</label>
									<input class="form-control form-control-lg" name="departamento" type="text" placeholder="Ingrese un Departamento" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Distrito:</label>
									<input class="form-control form-control-lg" name="distrito" type="text" placeholder="Ingrese un Distrito" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Avenida:</label>
									<input class="form-control form-control-lg" name="avenida" type="text" placeholder="Ingrese una Avenida" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Calle y Número:</label>
									<input class="form-control form-control-lg" name="calle" type="text" placeholder="Ingrese una Calle con Número de Casa" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Referencia (opcional):</label>
									<input class="form-control form-control-lg" name="referencia" type="text" placeholder="Ingrese una Referencia"/>
								</div>
		                	
		                		<div class="d-grid gap-2 col-6 mx-auto">
									<input class="btn btn-primary btn-lg" type="submit" name="" value="Registrar Dirección">
								</div>
		                	</c:when>
		                	<c:otherwise>
		                		<input name="clienteId" type="hidden" value="${sessionScope.usuario.clienteId}"/>
						
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px; padding-top: 10px">
									<label for="exampleFormControlInput1" class="form-label">País:</label>
									<input class="form-control form-control-lg" name="pais" type="text" placeholder="Ingrese un País" value="${pais}" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Departamento:</label>
									<input class="form-control form-control-lg" name="departamento" type="text" placeholder="Ingrese un Departamento" value="${departamento}" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Distrito:</label>
									<input class="form-control form-control-lg" name="distrito" type="text" placeholder="Ingrese un Distrito" value="${distrito}" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Avenida:</label>
									<input class="form-control form-control-lg" name="avenida" type="text" placeholder="Ingrese una Avenida" value="${avenida}" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Calle y Número:</label>
									<input class="form-control form-control-lg" name="calle" type="text" placeholder="Ingrese una Calle con Número de Casa" value="${calle}" required/>
								</div>
								<div class="mb-3 " style="padding-bottom: 10px; padding-left: 50px; padding-right: 50px;">
									<label for="exampleFormControlInput1" class="form-label">Referencia (opcional):</label>
									<input class="form-control form-control-lg" name="referencia" type="text" placeholder="Ingrese una Referencia" value="${referencia}"/>
								</div>
		                	
		                		<div class="d-grid gap-2 col-6 mx-auto">
									<input class="btn btn-primary btn-lg" type="submit" name="" value="Editar Dirección">
								</div>
		                	</c:otherwise>
		                </c:choose>				
				</form>
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