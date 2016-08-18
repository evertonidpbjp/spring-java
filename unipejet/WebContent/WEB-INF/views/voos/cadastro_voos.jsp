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
    <script type="text/javascript" src="ajax.js" ></script>

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
	


</head>

<body>


<form:form servletRelativeAction="/voos/salvar_voos" method="post"  commandName="voos">
		<span style="color: blue"> ${sucesso } </span>
		
	<div>
			<label for="origem"> Origem</label>
			<form:input  path="origem" id="origem" name="origem" type="text" placeholder="Digite a Origem"/>
            <form:errors path="origem" style="color: red"/>
	</div>
				
		
	<div>
			<label for="destino" id="destino"> Destino</label>
			<form:input path="destino" name="destino" type="text" id="destino" placeholder="Digite o Destino"/>
		    <form:errors path="destino" style="color: red" />
		</div>
		
		
		<div>
			<label for="login"> Duração</label>
			<form:input  path="duracao" id="duracao"  type="text" name="duracao" placeholder="Digite a Duração"/>
			<form:errors path="duracao" style="color: red"/>
		</div>
		<div>
			<label for="distancia"> Distancia</label>
			<form:input  path="distancia" id="distancia" name="distancia" type="text"/>
			<form:errors path="distancia" style="color: red"/>
		</div>
			
		<div>
			<label for="preco"> Preço</label>
			<form:input  path="preco" id="preco" name="preco" type="number"/>
			<form:errors path="preco" style="color: red"/>
		</div>	
			
			
			<div>
			<label for="capacidade"> Capacidade</label>
			<form:input  type="number" path="capacidade" id="capacidade" name="capacidade"/>
			<form:errors path="capacidade" style="color: red"/>
		</div>	
			
			
			
    <div>
	<label for="releaseDate"> Hora de Partida</label>
	<form:input path="hora_partida" type="time" name="hora_partida" id="hora_partida" />
	<form:errors path="hora_partida" style="color: red"/>
	</div>
	
	    <div>
	<label for="data"> Data</label>
	<form:input path="data" type="date" name="data" id="data" />
	<form:errors path="data" style="color: red"/>
	</div>
			
			<input type="hidden" name="assentos"  id="assentos">
<div>
<input type="submit" value="Enviar">
</div>

</form:form>

</body>
</html>