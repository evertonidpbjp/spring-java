<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="user" />
</sec:authorize>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/css/sb-admin.css'/>">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Bootstrap Admin Template</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.0.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js">
	
</script>
<script>
	$(document).ready(function() {
		$('#formulario').validate({
			rules : {

				origem : {
					required : true

				},
				destino : {

					required : true

				},

				duracao : {

					required : true
				},

				distancia : {

					required : true,

				},

				preco : {
					required : true

				},
				capacidade : {
					required : true

				},

				data : {
					required : true

				},

				hora_partida : {
					required : true,

				}
			},

			messages : {
				origem : {
					required : "Campo obrigat�rio"

				},
				destino : {

					required : "Campo obrigat�rio"

				},

				duracao : {

					required : "Campo obrigat�rio"
				},

				distancia : {

					required : "Campo obrigat�rio"

				},

				preco : {
					required : "Campo obrigat�rio"

				},
				capacidade : {
					required : "Campo obrigat�rio"

				},

				data : {
					required : "Verifique a Data"

				},

				hora_partida : {
					required : "Campo obrigat�rio"

				}

			}

		});

	});
</script>

<style>
label.error {
	color: red;
	padding: 2px
}
</style>


</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="${spring:mvcUrl('UC#homePage').build()}">UnipeJet</a>
			</div>
			        <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
           

                <li class="dropdown">
                    <a  class="dropdown-toggle" data-toggle="dropdown"href="${spring:mvcUrl('CC#carrinho').arg(0,user.login).build()}"><i class="fa fa-shopping-cart" aria-hidden="true"> &nbsp; Carrinho  (${shoppingCart.quantity})</i> <b class="caret"></b></a>

                </li>
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>${user.name}<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                 
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li><a href="${spring:mvcUrl('UC#homePage').build()}"><i
							class="fa fa-fw fa-dashboard"></i> Voltar para a Home</a></li>

                  <sec:authorize access="hasRole('ROLE_ADMIN')">  
					<li><a href="${spring:mvcUrl('UC#list').build()}"><i
							class="fa fa-fw fa-user"></i> Administrar Usu�rios</a></li>


					<li class=""><a href="${spring:mvcUrl('VC#list_voo').build()}"><i
							class="fa fa-fw fa-plane"></i> Administrar Voos</a></li>


                    </sec:authorize>
					
					<li class=""><a
						href="${spring:mvcUrl('UC#logoutPage').build()}"><i
							class="fa fa-fw fa-plane"></i> Logout</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header"> Detalhes da Compra</h1>
						<h4>
							<span style="color: blue">${sucesso}
						</h4>

						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a
								href="${spring:mvcUrl('UC#homePage').build()}">Geral</a></li>
							<li class="active"><i class="fa fa-file"></i> Detalhes da Compra
							</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				<div class="row">
					<form:form name="formulario" method="post"
						servletRelativeAction="/compras/define_passageiros"
						id="formulario">
						<c:set var="tamanho" value="0" />
						<c:if test='${voo.assentos >= 9}' />
						<c:if test='${voo.assentos <  9}' />
						<c:choose>
							<c:when test="${voo.assentos >= 9}">
								<c:set var="tamanho" value="9" />
							</c:when>
							<c:when test="${voo.assentos < 9}">
								<c:set var="tamanho" value="${voo.assentos}" />
							</c:when>
							<c:otherwise>
								<c:set var="tamanho" value="9" />
							</c:otherwise>
						</c:choose>



						<div class="col-lg-6">
							<input type="hidden" name="identificador" id="identificador"
								value="${voo.identificador}" />
								
							 <input name="restantes" id="restantes" type="hidden"  value="${voo.assentos}"   readonly/>	
							<div class="form-group" name="origem">
								<label> Escolha o n�mero de Passagens</label>
                                 <select name="passagens" id="passagens"  class="form-control">  
			                    <c:forEach begin="1" end="${tamanho}" varStatus="loop">
			                    <option value="${loop.index}"> ${loop.index} </option>
			                    </c:forEach>
			                    </select>
							</div>
							
							<label for=""> Distancia em Milhas</label>
						     		<div class="form-group input-group">
					 <input name="distancia" id="distancia" type="text" value="${voo.distancia * 0.62137}"  class="form-control" readonly />
								 <span
									class="input-group-addon">Km</span>
							</div>
								
							
							
							
				            
				         <label for="">Preco unitario</label>
							<div class="form-group input-group">
								<span class="input-group-addon">R$</span>
								<input type="number" name="preco" id="preco" value="${voo.preco}"  class="form-control" disabled>
								 <span
									class="input-group-addon">.00</span>
							</div>
				            
				            				            
				            
						</div>
						<div class="col-lg-6">
							
							<div class="form-group">
								<label> Assentos Dispon�veis</label>
								
								<input type="number" name="assentos" id="assentos" value="${voo.assentos}" class="form-control" disabled>

							</div>
				            
                           
				            
							<label for=""> Total em Reais</label>
							<div class="form-group input-group">
								<span class="input-group-addon">R$</span> 
								<input name="total" id="total" type="text" value="${voo.preco}"  class="form-control" readonly/> <span
									class="input-group-addon">.00</span>
							</div>
				            
				            
				            <label for="">Total em Milhas</label>
							<div class="form-group input-group">
					 
							<input name="total_milhas" id="total_milhas" type="text" value="${voo.distancia * 0.62137}"  class="form-control" readonly/> 
							 <span
									class="input-group-addon">Km</span>
							</div>
							
							
							
                            <a  href="${spring:mvcUrl('VC#pesquisa_voo').build()}"><button type="button" class="btn btn-lg btn-danger"> Voltar</button></a>
							<input type="submit" class="btn btn-lg btn-primary"
								value="Continuar Compra">
						</div>
				</div>
				</form:form>
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		// Calculando o pre�o da quantidade de produtos de acordo com a varia��o do number

		$(function($) {

			$('#passagens').click(
					function() {

						//Pega valores dos campos e faz as devidas convers�es
						var passagens = $('#passagens').val();
						var preco = $('#preco').val();
						assentos = parseFloat(document
								.getElementById("assentos").value);

						var restantes = assentos - passagens;

						//Verifia se o n�mero de assentos ainda est� dispon�vel
						if (restantes <= 0) {

							restantes = 0;
							$('#passagens').attr({
								'max' : passagens

							});
						}

						$('#restantes').attr({
							'value' : restantes

						});

						//Calcula total em milhas

						var distancia = $('#distancia').val();
						var total_milhas = distancia * passagens;
						$('#total_milhas').attr({
							'value' : total_milhas

						});

						// Calcula o total e mostra no campo
						var total = preco * passagens;
						$('#total').attr({
							'value' : total

						});
                     


						
						
					});

		});
	</script>






</body>

</html>
