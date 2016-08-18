<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Usuário</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js" ></script>
    <script type="text/javascript" src="ajax.js" ></script>


	
	
	 <script type="text/javascript">
          
	 $(document).ready(function() {
        $("#password").hide();
        $("#l_password").html("");
		 $("#alterar").click(MostrarSenha);
         $("#manter").click(EsconderSenha);
         });
	 
	 
	       $(document).ready(function() {
                $("#alterar").click(MostrarSenha);
                $("#manter").click(EsconderSenha);
                });
 
            function MostrarSenha(){
                $("#password").show();
                $("#l_password").html("Senha");
                
            }
            function EsconderSenha(){
                $("#password").hide();
                $("#l_password").html("");
            }
           
        </script>
	


<script>

$(function($){
	 
    // No id #enviar assim que clicar executa a função
    $('#releaseDate').blur(function(){
 
    /* veja que eu criei variáveis para guardar os item
     * e só precisei usar a função val() para
     * retornar o valor dos campo para a várivel
     */
 
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


<form:form servletRelativeAction="/efetuar_alteracao" method="post"  commandName="user">
		<span style="color: blue"> ${sucesso } </span>
		<span style="color: red"> ${erro} </span>
		
		<div>
			<label for="login">Login (email)</label>
			<input style="color: blue" value="${user.login}" id="login" name="login" placeholder="Digite o seu email" readonly/>
			<form:errors path="login" style="color: red"/>
		</div>
		
		
	<div>
			<label for="name"> Nome</label>
			<form:input  path="name" id="name" name="name" type="text" />
            <form:errors path="name" style="color: red"/>
	</div>
		
		
		
	<div>
			<label for="rg" id="l_documento"> ${user.tipo_documento}</label>
			<form:input path="documento" name="documento" type="text" id="documento" placeholder="Digite o seu ${user.tipo_documento}"/>
		    <form:errors path="documento" style="color: red" />
		</div>
		
		
		
		
		    Manter Senha Atual  <input name="manipula_senha"  type="radio" id="manter" value="manter" checked/>
			Alterar Senha       <input name="manipula_senha" type="radio" id="alterar" value="alterar" />
		
		
		<div>
			<label for="password" id="l_password"> Senha</label>
			<input value="${user.password}" id="password" name="password" type="text"/>
			<form:errors path="password" style="color: red"/>
		</div>
		
		
			
    <div>
	<label for="releaseDate">Data de Nascimento</label>
	<form:input path="releaseDate" type="date" name="releaseDate" id="releaseDate" />
	<form:errors path="releaseDate" style="color: red"/>
	</div>
	<div>
			<label for="cartao_milha"></label>s
			<form:hidden path="cartao_milha" name="cartao_milha" value="${user.cartao_milha}"/>
			<input type="hidden" name="tipo_documento" value="${user.tipo_documento}" />
			<input type="hidden" value="${user.senha_testa}"   id="senha_testa" name="senha_testa"/>
	
<sec:authorize access="hasRole('ROLE_ADMIN')">

 Role 	<select name="role">
  <option value="ROLE_COMPRADOR" selected> COMPRADOR (conta limitada)</option>
  <option value="ROLE_ADMIN"> ADMINISTRADOR</option>

</select>	

</sec:authorize>
	<input type="text" name="role" value="${user.role}" />
	
	<sec:authorize access="hasRole('ROLE_COMPRADOR')">



    </sec:authorize>
	
	
	
		</div>
	  <!--  <output name="output" id="out" >  18</output> anos -->
		<input name="idade" type="hidden" id="idade" value="${user.idade}">
        <form:errors path="idade" style="color: red"/>
<div>
<input type="submit" value="Enviar">
</div>

</form:form>

</body>
</html>