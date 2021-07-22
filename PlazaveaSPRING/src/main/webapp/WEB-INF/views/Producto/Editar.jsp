<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
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
	<link rel="stylesheet" href="../css/main.css" type="text/css">
<title>Editar</title>
</head>
<body background='<c:url value="/img/background.jpg"/>'
	style="background-size: cover;">
	<!--Header-->
	<%@include file="/WEB-INF/views/shared/headerFindProd.jsp"%>
	<div class="container" style="padding: 20px;">
      <div class="row">
        <div class="col-md-2" style="padding-right: 20px; padding-top: 20px;background: #eef111;">
				<h5>Editar Producto <i class="fas fa-plus-circle"></i></h5>
			</div>
        <div class="col-md-10" style="background: #fff; padding: 15px 20px 15px 20px; min-height: calc(100vh - 60px - 40px - 35px);">
            <h3>Editar</h3>
            <div style="padding-top: 10px;">
              <div class="container bg-dark text-white" style="padding: 20px 100px 20px 100px ;">
                <form:form name="" method="post" modelAttribute="producto" 
					enctype="multipart/form-data" acceptCharset="utf-8">
				  <div class="mb-3">
                    <label for="idInput" class="form-label">ID</label>
                    <form:input type="text" class="form-control" id="idInput" path="productoId" readonly="true" maxlength="255"/>
                  </div>
                  <div class="mb-3">
                    <label for="nombreInput" class="form-label">Nombre (*)</label>
                    <form:input type="text" class="form-control" id="nombreInput" path="nombre" required="true" maxlength="255"/>
                  </div>
                  <div class="mb-3">
                    <label for="precioUnidad" class="form-label">Precio (*)</label>
                    <form:input type="number" class="form-control" id="precioUnidad" path="precioUnidad" step="any" required="true"/>
                  </div>
                  <div class="mb-3">
                    <label for="Stock" class="form-label">Stock (*)</label>
                    <form:input type="text" class="form-control" id="Stock" onkeypress='return event.charCode >= 48 && event.charCode <= 57' path="stock" required="true" maxlength="5"/>
                  </div>
                  <div class="mb-3">
                    <label for="Descripcion" class="form-label">Descripcion (*)</label>
                    <form:input type="text" class="form-control" id="Descripcion" path="descripcion" required="true" maxlength="255"/>
                  </div>
                  <div class="mb-3">
                    <label for="imagenInput" class="form-label">Seleccione Imagen</label>
                    <input type="file" class="form-control form-control-sm" name="picture" accept="image/jpeg, image/png" id="imagenInput"
                    	/>
                    <div class="table-responsive" style="padding: 10px 140px 0px 140px">
                      <table class="table table-success table-stripped">
                        <thead>
                          <tr>
                            <th scope="col" style="text-align: center;">Imagen Actual</th>
                            <th scope="col" style="text-align: center;">Nueva Imagen</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td align="center">
                            	<c:set var="typeImg" value="${fn:substringAfter(producto.nombreImagen,'.')}"/>
								<img src="data:image/${typeImg};base64,${producto.getBase64Image()}" width="100" height="100"/>
							</td>
							<td align="center">
								<img id="imagenPrevisualizacion" width="100" height="100"/>
							</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div class="mb-3">
                    <label for="Categoria" class="form-label">Categoria</label>
                    <form:select path="categoria.categoriaId" class="form-select form-select-sm" id="Categoria">
						<form:options items="${Categorias}" itemValue="categoriaId" itemLabel="nombre"/>
					</form:select>
                  </div>
                  <div class="mb-3">
                    <label for="Proveedor" class="form-label">Proveedor</label>
                    <form:select path="proveedor.proveedorId" class="form-select form-select-sm" id="Proveedor">
						<form:options items="${Proveedores}" itemValue="proveedorId" itemLabel="razonSocial"/>
					</form:select>
                  </div>
                  <div style="text-align: right;">
                    <button class="btn btn-success btn-sm" type="button" id="btnEdit">Guardar</button>
                    <button class="btn btn-danger btn-sm" type="button" onclick="location.href='<c:url value="/Producto/${producto.productoId}"/>'">Cancelar</button>
                  </div>

                </form:form>

              </div>

            </div>
        </div>
      </div>
      
    </div>
	

	<!--Final-->
	<%@include file="/WEB-INF/views/shared/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
		$(document).ready(function (){
			$('form #btnEdit').click(function (e) {
				let $form = $(this).closest('form');
				
				var v = true;
				
				$form.find(':input').each(function(){
					var elemento = this;
					if (elemento.id === 'btnEdit' || elemento.id.length === 0 || elemento.id === 'imagenInput') {
						;
					} else if (elemento.value.length === 0) {
						v = false;
					};
				})
				
				if (v === false) {
					Swal.fire({
						icon: 'error',
						title: 'Complete los campos faltantes',
						confirmButtonText: 'Volver a intentar'
					})
				} else {
					Swal.fire({
						icon: 'success',
						title: 'Producto editado',
						confirmButtonText: 'OK'
					}).then((result) => {
						$form.submit();
					})
				}
				
			})
		})
	</script>
	<script type="text/javascript">
		const $seleccionArchivos = document.querySelector("#imagenInput"),
		  $imagenPrevisualizacion = document.querySelector("#imagenPrevisualizacion");
	
	
		  $seleccionArchivos.addEventListener("change", () => {
		  
		  const archivos = $seleccionArchivos.files;
		  
		  if (!archivos || !archivos.length) {
		    $imagenPrevisualizacion.src = "";
		    return;
		  }
		  
		  const primerArchivo = archivos[0];
		  
		  const objectURL = URL.createObjectURL(primerArchivo);
		  
		  $imagenPrevisualizacion.src = objectURL;
		});
	</script>
</body>
</html>