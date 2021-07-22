<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #cf260f;">
		<div class="container-fluid">
			<a class="navbar-brand" href="<c:url value='/Index'/>"> <img src='<c:url value="img/vea2.png"/>' alt=""
				width="85" height="45">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item active"><a class="nav-link" href="<c:url value='/Index'/>">Página
							Principal</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Categorías </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<c:forEach var="categoria" items="${sessionScope.bCategoria}">
								<li><a class="dropdown-item" href="<c:url value='/findProductoByCat/${categoria.nombre}'/>">${categoria.nombre}</a></li>
								
							</c:forEach>
						
						
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="<c:url value='/ListProveedores'/>">Lista de Proveedores</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#">Servicio
							al Cliente</a></li>
				</ul>


				<div class="collapse navbar-collapse d-flex"
					id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto p-2">
						<c:choose>
									<c:when test = "${sessionScope.carritocount > 0 && sessionScope.userType != 't'}">
										<li class="nav-item dropdown">
											<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
												role="button" data-bs-toggle="dropdown" aria-expanded="false">
												<i class="fas fa-shopping-cart"></i> Carrito de Compra : 
							            			<span style="color: yellow;">${sessionScope.carritocount}</span>
											</a>
											<ul class="carrito dropdown-menu" aria-labelledby="navbarDropdown">
												<c:forEach var="objcar" items="${sessionScope.carritohead}">
													<c:set var="typeImage" value="${fn:substringAfter(objcar[0].nombreImagen,'.') }" />
													<li class="text-center">
														<img src="data:image/${typeImage};base64,${objcar[0].getBase64Image()}" width="80px" height="50px"/>
														<a class="dropdown-item" href="<c:url value='/Producto/${objcar[0].productoId}'/>">${objcar[0].nombre}</a>
														<span>Cantidad: ${objcar[1]}</span>
													</li>
												</c:forEach>
	
												<li><hr class="dropdown-divider"></li>
												<li><button type="button" class="dropdown-item" onClick="vercarcompra('${sessionScope.usuario.nombre}')"><b>Ver en el Carrito</b></button></li>
											</ul></li>
									</c:when>
									<c:when test="${sessionScope.userType == 't' }">
										<li class="nav-item dropdown">
											<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
												role="button" data-bs-toggle="dropdown" aria-expanded="false">
												<i class="fas fa-shopping-cart"></i> Carrito de Compra
											</a>
											<ul class="carrito dropdown-menu" aria-labelledby="navbarDropdown">
										
													<li class="text-center">
														<a class="dropdown-item disabled" href="#">Los transportistas no pueden comprar.</a>
													</li>

											</ul></li>
									</c:when>
									<c:otherwise>
							            <li class="nav-item dropdown">
											<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
												role="button" data-bs-toggle="dropdown" aria-expanded="false">
												<i class="fas fa-shopping-cart"></i> Carrito de Compra
											</a>
											<ul class="carrito dropdown-menu" aria-labelledby="navbarDropdown">
										
													<li class="text-center">
														<a class="dropdown-item disabled" href="#">No hay productos en el carrito</a>
													</li>

											</ul></li>
							         </c:otherwise>
														
						</c:choose>
					<c:choose>
						<c:when test="${sessionScope.usuario == null}">
							
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">
										<i class="far fa-user"></i> Mi usuario
								</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="<c:url value='/Login'/>"><i
												class="fas fa-user-circle"></i> Iniciar Sesión</a></li>
										<li><a class="dropdown-item" href="<c:url value='/Registro'/>"><i
												class="fas fa-address-card"></i> Registrarse</a></li>
									</ul></li>
						</c:when>
						<c:when test="${sessionScope.userType == 't' }">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">
										<i class="far fa-user"></i> Bienvenido <b>${sessionScope.usuario.nombre}!</b>
								</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="<c:url value='/VerDatos/transportista'/>"><i
												class="fas fa-user-circle"></i> Ver Datos Personales </a></li>
												<li><a class="dropdown-item" href="<c:url value='/ListDelivery'/>"><i class="fas fa-list"></i> Listar Pedidos de Delivery </a></li>
										<li><a class="dropdown-item" href="<c:url value='/Logout'/>"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión </a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="<c:url value='/InsertaProducto'/>"><i
												class="fas fa-archive"></i> Registrar Producto</a></li>
										<li><a class="dropdown-item" href="<c:url value='/reporte_listar'/>"><i class="fas fa-file-signature"></i> Reportes sobre el sistema</a></li>
									</ul></li>
						</c:when>
						<c:otherwise>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">
										<i class="far fa-user"></i> Bienvenido <b>${sessionScope.usuario.nombre}!</b>
								</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="<c:url value='/VerDatos/cliente'/>"><i
												class="fas fa-user-circle"></i> Ver Datos Personales </a></li>
										<li><a class="dropdown-item" href="<c:url value='/Logout'/>"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión </a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="<c:url value='/VerHistorialCompras'/>"><i
												class="fas fa-archive"></i> Historial de Compras</a></li>
									</ul></li>
							
						</c:otherwise>
					</c:choose>
					</ul>
				</div>
				<!-- Añadir Boton de Carro de compra -->
				
				<div class="d-flex">
					<input class="form-control me-1 " type="text"
						placeholder="Buscar Productos" id="btnBuscar" autocomplete="off">
					<button type="button" class="btn btn-primary btn-sm" onclick='buscar()'>Buscar</button>
				</div>
			</div>
		</div>
	</nav>