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
 <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.0.min.js"></script>
 <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"> </script>
<script>
$(document).ready(function(){
	$('#formulario').validate({
	 rules: {

	   origem: {
	         required: true
	         

	},
	   destino: {

	      required: true
	     

	},

	    duracao: {

	   required: true
	},

	    distancia: {
	    
	    required: true,
	    
	},

	   preco: {
	    required: true
	    

	},
	capacidade: {
       required: true

	},

	 hora_partida: {
	   required: true,
	  
	 
	 }
	},
	
	messages:
	{
		 origem: {
	         required: "Campo obrigatório"
	         

	},
	   destino: {

	      required: "Campo obrigatório"
	     

	},

	    duracao: {

	   required: "Campo obrigatório"
	},

	    distancia: {
	    
	    required: "Campo obrigatório"
	    
	},

	   preco: {
	    required: "Campo obrigatório"
	    

	},
	capacidade: {
       required: "Campo obrigatório"

	},

	 hora_partida: {
	   required: "Campo obrigatório"
	  
	 
	 }

	}

	});

	});
 
</script>

<style>  label.error{color: red; padding: 2px}</style>
</head>

<body>


<form:form  id="formulario" servletRelativeAction="/voos/altera_voo" method="post"  commandName="voo">
		<span style="color: blue"> ${sucesso } </span>
		
	
	<div>
		
			<form:hidden path="identificador" id="identificador" name="identificador" value="${voo.identificador}"/>
            <form:errors path="identificador" style="color: red"/>
	</div>	
		
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
			<form:input  path="duracao" id="duracao"  type="text" name="duracao" placeholder="Digite a Duração em horas ou dias"/>
			<form:errors path="duracao" style="color: red"/>
		</div>
		<div>
			<label for="distancia"> Distancia</label>
			<form:input  path="distancia" id="distancia" name="distancia" type="text" placeholder="Digite a distancia em Km"/>
			<form:errors path="distancia" style="color: red"/>
		</div>
			
		<div>
			<label for="preco"> Preço</label>
			<form:input  path="preco" id="preco" name="preco" type="number" placeholder="Defina o preço"/>
			<form:errors path="preco" style="color: red"/>
		</div>	
			
			
			<div>
			<label for="capacidade"> Capacidade</label>
			<form:input  type="number" path="capacidade" id="capacidade" name="capacidade" placeholder="Digite número de assentos"/>
			<form:errors path="capacidade" style="color: red"/>
		</div>	
			
			
			
    <div>
	<label for="releaseDate"> Hora de Partida</label>
	<form:input path="hora_partida" type="time" name="hora_partida" id="hora_partida" placeholder="Defina o horário" />
	<form:errors path="hora_partida" style="color: red"/>
	</div>
			
			
		
<div>
<input type="submit" value="Enviar">
</div>

</form:form>

</body>
</html>