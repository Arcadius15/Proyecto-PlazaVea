<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>${valor} - Buscar por Proveedor</title>
</head>

<!--Header-->
<body background='<c:url value="../img/background.jpg"/>' style="background-size: cover;">
	<!-- Inicio -->
	<%@include file="/WEB-INF/views/shared/headerFindProd.jsp"%>
	
	<!-- Cuerpo -->
	<div class="container" style="padding: 20px;">
        <div class="row">
            <div class="col-md-3" style="background: #eef111;" >
				<div style="padding-top: 10px; padding-bottom: 5px;">
					<h5>"${valor}" - Mostrando Productos por Proveedor</h5>
				</div>
                <div class="accordion" id="accordionPanelsStayOpenExample">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                          Proveedor
                        </button>
                      </h2>
                      <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                        <div class="accordion-body">
                        	<div class="form-check">
	                            <input class="form-check-input" type="checkbox" value="${valor}" id="${valor}" readonly="readonly" checked onclick="javascript: return false;">
	                            <label class="form-check-label" for="${valor}">
	                              ${valor}
	                            </label>
	                        </div>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="true" aria-controls="panelsStayOpen-collapseTwo">
                          Categoria
                        </button>
                      </h2>
                      <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingTwo">
                        <div class="accordion-body">
	                    	<c:forEach var="categoria" items="${bCategoria}">
	                            <div class="form-check">
	                                <input class="form-check-input" type="checkbox" value="${categoria}" id="${categoria}" onchange="filtrarCat(this)">
	                                <label class="form-check-label" for="${categoria}">
	                                  ${categoria}
	                                </label>
	                            </div>
                            </c:forEach>
                            <div align="center" style="padding-top: 10px;">
	                            <button type="button" class="btn btn-primary btn-sm" id="borrarCategorias" onclick="borrarCategorias()">Borrar Filtros de Categoría</button>
	                        </div>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="true" aria-controls="panelsStayOpen-collapseThree">
                          Precio
                        </button>
                      </h2>
                      <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingThree">
                        <div class="accordion-body">
                        	<form>
	                            <div class="row">
	                            	<div class="col-md-6">
		                            	<label for="PrecioMin" class="form-label">
			                                    Min.
			                            </label>
		                            	<input class="form-control me-2" type="number" value="0" id="PrecioMin" required>
	                            	</div>
	                                <div class="col-md-6">
	                                	<label for="PrecioMax" class="form-label">
			                                    Max.
			                            </label>
		                            	<input class="form-control me-2" type="number" value="9999" id="PrecioMax" required>
	                            	</div>
	                            </div>
	                            <div align="center" style="padding-top: 15px">
	                            	<button type="button" class="btn btn-primary btn-sm" onclick='filtrarPre()'>Filtrar</button>
	                            	<button type="button" class="btn btn-danger btn-sm" onclick='quitarFiltPre()'>Remover Filtro</button>
	                            </div>
	                            <div align="center" style="padding-top: 10px; display: none" id="filtPreMsg">
	                            	<h6 style="color: green">Filtro de precio aplicado</h6>
	                            </div>
                            </form>
                        </div>
                      </div>
                    </div>
                  </div>

            </div>
            <div class="col-md-9" style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh); margin: auto;">
                <table id="tProductos" class="table table-hover" style="width:100%;background-color: #cf260f;">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Proveedor</th>
                            <th>Categoría</th>
                            <th>Imagen</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="producto" items="${bProducto}">
									<tr>
										<td>${producto.nombre}</td>
										<td>${producto.precioUnidad}</td>
										<td>${producto.stock}</td>
										<td>${producto.proveedor.nombre}</td>
										<td>${producto.categoria.nombre}</td>
										<td>
											<c:set var="typeImage" value="${fn:substringAfter(producto.nombreImagen,'.') }" />
											<a href="<c:url value='/Producto/${producto.productoId}'/>">
												<img src="data:image/${typeImage};base64,${producto.getBase64Image()}" width="200px" height="150px"/>
											</a>
										</td>
									</tr>
						</c:forEach>
                    </tbody>
                </table>
                <div align="center" style="display: none;" id="zeroMsg">
                	<h5>No se encontraron productos.</h5>
                </div>
            </div>
        </div>
    </div>
	

	<!--Final-->
	<footer class="text-white fixed-bottom"
		style="background-color: #cf260f;">
		<ul class="nav text-left">
			<li class="nav-item"><a class="nav-link text-reset disabled"
				href="#">Plaza Vea Copyright &copy; <script>
					document.write(new Date().getFullYear())
				</script>
			</a></li>
			<li class="nav-item"><a class="nav-link text-reset"
				href="https://www.facebook.com/plazaVeaOficial/" target="_blank"><i
					class="fab fa-facebook"></i> Facebook</a></li>
			<li class="nav-item"><a class="nav-link text-reset"
				href="https://www.instagram.com/plazavea.oficial" target="_blank"><i
					class="fab fa-instagram"></i> Instagram</a></li>
			<li class="nav-item"><a class="nav-link text-reset"
				href="https://twitter.com/plazavea" target="_blank"><i
					class="fab fa-twitter"></i> Twitter</a></li>
		</ul>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="../js/Index.js"></script>
	<script type="text/javascript" src="../js/Filter.js"></script>

</body>
</html>