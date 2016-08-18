<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;
charset=UTF-8">

<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.0.min.js"></script>
 <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"> </script>
<script type="text/javascript">

// Calculando o preço da quantidade de produtos de acordo com a variação do number

$(function($){
	 
    $('#passagens').click(function(){
   
    //Pega valores dos campos e faz as devidas conversões
    var passagens = $('#passagens').val();
    var preco = $('#preco').val();
    assentos = parseFloat(document.getElementById("assentos").value);
  
    var restantes = assentos - passagens;
 
    
  //Verifia se o número de assentos ainda está disponível
    if(restantes <= 0)
    	{
    	 
    	   restantes = 0; 
    	    $('#passagens').attr({
    	    	   'max': passagens
    	    	  
    	    	});
    	}
  

   
    
    $('#restantes').attr({
 	   'value': restantes
 	  
 	});
    
    // Calcula o total e mostra no campo
    var total = preco * passagens;
    $('#total').attr({
  	   'value': total
  	  
  	});
     
    

      
    
      });
      
      
    });


</script>

</head>
<body>

<a href="${spring:mvcUrl('CC#carrinho').build()}"> Seu carrinho (${shoppingCart.quantity})</a>
<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user"/>
		<div>
 Olá ${user.name}

</div>
	</sec:authorize>


<h2> Detalhes do Voo</h2>
<table>
<tr>
<th>Identificador</th>
<th>Origem</th>
<th> Destino </th>
<th> Hora de Partida </th>
<th> Data</th>

<th> Preço </th>
</tr>
<tr>
<td> ${voo.identificador}  </td>

<td> ${voo.origem} </td>

<td> ${voo.destino}  </td>

<td align="center"> ${voo.hora_partida} </td>

<td> ${voo.data} </td>



</table>

<h2> Defina o número de assentos</h2>

<form:form name="formulario" method="post" servletRelativeAction="/compras/define_passageiros"  >

		<input type="hidden" name="identificador" id="identificador" value="${voo.identificador}" />
		<div>
			<label for="passagens"> Número de Passagens</label>
			
			<select name="passagens" id="passagens"> 
			<option value="1"> 1 </option>
			<option value="2"> 2 </option>
			<option value="3"> 3 </option>
			<option value="4"> 4 </option>
			<option value="5"> 5 </option>
			<option value="6"> 6 </option>
			<option value="7"> 7 </option>
			<option value="8"> 8 </option>
			<option value="9"> 9 </option>
			</select>
			
			
			<!--   <input id="passagens"  type="number" name="passagens" style="width: 50px" value="1" max='9' min="1"  /> -->
		 
		</div>
	   <label for="preco"> Preço Unitário</label>
		<input type="number" name="preco" id="preco" value="${voo.preco}" disabled><br>
		<label for="preco"> Assentos Disponíveis</label>
		<input type="number" name="assentos" id="assentos" value="${voo.assentos -1}" disabled><br>
		 <label for="restantes"> Restantes: </label>
        <input name="restantes" id="restantes" type="text"  value="${voo.assentos}" disabled/> <br>
		<label for="total"> Total : R$ </label>
		<input name="total" id="total" type="text" value="${voo.preco}" readonly/>  <br>
       
        <br>
         
         <input type="submit" value="Continuar ->">



</form:form>


<script type="text/javascript">

// Calculando o preço da quantidade de produtos de acordo com a variação do number

$(function($){
	 

    $('#passagens').change(function(){
   
    //Pega valores dos campos e faz as devidas conversões
    var passagens = $('#passagens').val();
    var preco = $('#preco').val();
    assentos = parseFloat(document.getElementById("assentos").value);
  
    var restantes = assentos - passagens;
 
    
  //Verifia se o número de assentos ainda está disponível
    if(restantes <= 0)
    	{
    	 
    	   restantes = 0; 
    	    $('#passagens').attr({
    	    	   'max': assentos
    	    	});
    	      
    	    
    	
    	
    	}
  

   
    
    $('#restantes').attr({
 	   'value': restantes
 	  
 	});
    
    // Calcula o total e mostra no campo
    var total = preco * passagens;
    $('#total').attr({
  	   'value': total
  	  
  	});
     
    

    
    
    
      });

   
    
    });


</script>

</body>
</html>