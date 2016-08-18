<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro Usuario </title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js" ></script>
   

<!-- 
<script>

$(function($){
	 

 
      var data = $('#releaseDate').val();
 
        
    
    
        $.get("converteData", {'data' : data}, function(resposta) {
        	$("#out").html("Finalizado");
        	alert(resposta);
        	});
        
   
    });
});
</script>
-->
	
<script>

$(function($){
	 
    $('#rg').click(function(){
   
    	$("#l_documento").html("RG");
      
      $('#documento').attr({
   	   'placeholder': 'Digite seu Rg',
      });
      
      
    });


    $('#cpf').click(function(){
     
    	$("#l_documento").html("CPF");
    	
        $('#documento').attr({
      	   'placeholder': 'Digite seu cpf',
      	  
      	});
        
        
      });




});
</script>


<script>

$(function($){
	 
   
    $('#releaseDate').blur(function(){

 
      var data = $('#releaseDate').val();
 
        dataAtual = new Date(data);
        var ano = dataAtual.getYear();
        var idade = 116 - ano;
    	$("#out").html(idade);
       
    	$('#idade').attr({
       	   'value': idade
       	  
       	});
    	
    });
});
</script>


</head>

<body>


<form:form servletRelativeAction="/cadastrar" method="post"  commandName="user">
		<span style="color: blue"> ${sucesso } </span>
		
	<div>
			<label for="nome"> Nome</label>
			<form:input  path="name" id="nome" name="name" type="text"/>
            <form:errors path="name" style="color: red"/>
	</div>
		
		
	<div>
			<label for="tipo_documento"> Tipo de Documento: </label>
		    RG  <input name="tipo_documento" type="radio" id="rg" value="rg" checked/>
			CPF <input name="tipo_documento" type="radio" id="cpf" value="cpf" />
		 
	</div>
		
		
	<div>
			<label for="rg" id="l_documento"> RG</label>
			<form:input path="documento" name="documento" type="text" id="documento" placeholder="Digite o seu Rg"/>
		    <form:errors path="documento" style="color: red" />
		</div>
		
		
		<div>
			<label for="login">Login (email)</label>
			<form:input  path="login" id="login" name="login" placeholder="Digite o seu email"/>
			<form:errors path="login" style="color: red"/>
		</div>
		<div>
			<label for="password"> Senha</label>
			<form:input  path="password" id="password" name="password" type="password"/>
			<form:errors path="password" style="color: red"/>
		</div>
			
    <div>
	<label for="releaseDate">Data de Nascimento</label>
	<form:input path="releaseDate" type="date" name="releaseDate" id="releaseDate" />
	<form:errors path="releaseDate" style="color: red"/>
	</div>
	<div>
			<label for="cartao_milha"></label>
			<input type="hidden" name="cartao_milha"/>
				
		
		   	<label for="role"></label>
			<input  type="hidden" name="role" value="ROLE_COMPRADOR"/>
			</div>		
		
		<!--   <output name="output" id="out" >  18</output> anos -->
		<input name="idade" type="hidden" id="idade">
        <form:errors path="idade" style="color: red"/>
<div>
<input type="submit" value="Enviar">
</div>

</form:form>

</body>
</html>