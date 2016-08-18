<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Define Passageiros</title>
</head>
<body>
<table>
<tr>
<td>Número do Voo: ${voo.identificador} </td> </tr>
<tr> <td>Voo ${voo.origem} -> ${voo.destino}</td> </tr> 
<tr> <td>Valor Total da Compra:  ${total} </td> </tr>
<tr> <td> Quantidade de Passagens:${passagens} </td> </tr>

</table>
<form:form name="formulario" method="post" servletRelativeAction="/compras/carrinho"  >
           
            <input type="hidden" name="numero_compra" value="1" />
            <input type="hidden" name="identificador" value="${voo.identificador}" />
	       <input type="hidden" name="total" value="${total}" />
	       <input type="hidden" name="passagens" value="${passagens}" />  
         	<c:forEach begin="1" end="${passagens}" varStatus="loop">
 
          <h3> Passageiro ${loop.index}   </h3>
          <label for="passageiros[${loop.index}]"> Nome: </label> 
          <input id="passageiros[${loop.index}].nome" name="passageiros[${loop.index}].nome" type="text" required>
          <br>
          <label for="passageiros"> CPF </label> 
          <input id="passageiros[${loop.index}].cpf"  name="passageiros[${loop.index}].cpf" type="text" required>
          <br>
         </c:forEach>
   
         <input type="submit" value="Adicionar ao Carrinho->">

</form:form>





</body>
</html>