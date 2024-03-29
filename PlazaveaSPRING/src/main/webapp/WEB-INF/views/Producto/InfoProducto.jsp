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

<title>Informaci�n del Producto</title>
</head>
<body background='<c:url value="/img/background.jpg"/>' style="background-size: cover;">
	<!-- Inicio -->
	<%@include file="/WEB-INF/views/shared/headerFindProd.jsp"%>

	<!-- Cuerpo -->
	<div style="padding-top: 100px">
		<div class="container text-center"
			style="background:rgba(245, 37, 9, 0.8); padding: 50px; ">

			<div class="card border-ligth mb-3"
				style="max-width: 10500px;background: #95e455;padding: 30px;">
				<div class="row g-0">
					<div class="col-md-4">
						<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
						<img
							src="data:image/${typeImage};base64,${producto.getBase64Image()}"
							width="300" height="360" style="border: 0px solid; padding: 10px" />
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<br>
							<h3 class="card-title" style="padding-bottom: 25px;">
                                <i class="fas fa-info"></i>  
                                <span style="color: #cf260f;padding-left: 20px;font-family:Helvetica;"> Informaci�n del Producto</span>
                            </h3>
							<form:form name="" method="post" modelAttribute="producto"
								enctype="multipart/form-data">
								<input type="hidden" value="${producto.productoId}" id="productoid"/>


								<p style="font-size: 15pt;font-weight: 700;">
									<span style="padding-right: 20px;padding-left: 10px;">Nombre:</span> <span>${producto.nombre }</span>
								</p>
								<p style="font-size: 15pt;font-weight: 700;">
									<span style="padding-right: 20px;padding-left: 10px;">Precio Unidad:</span> <span>S./ ${producto.precioUnidad}</span>
								</p>
								<p style="font-size: 15pt;font-weight: 700;">
									<span style="padding-right: 20px;padding-left: 10px;">Stock Disponible:</span> <span>${producto.stock} unidades</span>
								</p>
								<p style="font-size: 15pt;font-weight: 700;">
									<span style="padding-right: 20px;padding-left: 10px;">Descripcion:</span> <span>${producto.descripcion}</span>
								</p>
                                <div style="text-align: center; padding: 1px 0;" class="btn-group"> 
                                    <p style="font-size: 10pt;font-weight: 700;margin-right: 15px">
                                        Seleccione Cantidad:
                                    </p>
                                    	<c:if test="${producto.stock > 0}">
	                                        <select class="form-select form-select-sm" style="max-width: 80px;max-height: 40px;" id="cantidad">
	                                        	<c:if test="${producto.stock <= 10}">
	                                        		<c:forEach var="i" begin="1" end="${producto.stock}">
		                                            	<option value="${i}" label="${i}"/>
		                                            </c:forEach>
	                                        	</c:if>
	                                            <c:if test="${producto.stock > 10}">
	                                            	<c:forEach var="i" begin="1" end="${10}">
		                                            	<option value="${i}" label="${i}"/>
		                                            </c:forEach>
	                                            </c:if>
	                                            
	                                        </select>
                                        </c:if>
                                        <c:if test="${producto.stock == 0}">
                                        	<select class="form-select form-select-sm" style="max-width: 80px;max-height: 40px;" id="cantidad" disabled="disabled">
                                        		<option value="0" label="0"/>
                                        	</select>
                                        </c:if>
                                        
                                        <div style="padding-left: 20px; margin-top: 5px;">
										  <h5 class="d-inline-block" id="popo" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" 
										  	data-bs-content="Por pol�tica de la tienda, solo puede agregar 10 unidades como m�ximo en una misma compra.">
										  	<i class="fas fa-info-circle"></i>
										  </h5>
										</div>
                                </div>
                                <br>
                                
								<div class="btn-group" role="group"
									style="margin-top: 20px;">
									<c:choose>
										<c:when test="${sessionScope.userType == 'c' && producto.stock != 0}">
											<button type="button" class="btn btn-primary" style="margin-right: 20px;" onclick="agregar()">A�adir
												a Carrito</button>
										</c:when>
										<c:when test="${sessionScope.usuario == null && producto.stock != 0}">
											<button type="button" class="btn btn-primary" style="margin-right: 20px;" onclick="agregar()">A�adir
												a Carrito</button>
										</c:when>
										<c:when test="${sessionScope.userType == 'c' && producto.stock == 0}">
											<button type="button" class="btn btn-primary" style="margin-right: 20px;" disabled="disabled">A�adir
												a Carrito</button>
											<p style="color: red; margin-top: 5px;">Fuera de Stock</p>
										</c:when>
										<c:when test="${sessionScope.usuario == null && producto.stock == 0}">
											<button type="button" class="btn btn-primary" style="margin-right: 20px;" disabled="disabled">A�adir
												a Carrito</button>
											<p style="color: red; margin-top: 5px;">Fuera de Stock</p>
										</c:when>
										<c:otherwise>
											<a href="<c:url value='/EditarProducto/${producto.productoId}'/>" class="btn btn-info" style="margin-right: 20px;">Editar Producto</a>
										</c:otherwise>
									</c:choose>
								</div>

							</form:form>
						</div>
					</div>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript" src="../js/Index.js"></script>
	<script src="../js/Carrito.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#popo").popover();
		})
	</script>
</html>