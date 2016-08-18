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
<title>Insert title here</title>
</head>
<body>


<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user"/>
		<div>
Olá ${user.name}
</div>
	</sec:authorize>


<span style="color:blue; text-align: center"> ${sucesso} </span>


<a href="${spring:mvcUrl('VC#cadastroVoos').build()}">Novo Voo </a> <br>


<table>
<tr>
<th>Identificador</th>
<th>Origem</th>
<th> Destino </th>
<th> Capacidade </th>
<th> Hora de Partida </th>
<th> Duração</th>

<th> Preço </th>
<th colspan"2"> Opções </th>
</tr>

<c:forEach items="${voos}" var="voo">
<tr>
<td> ${voo.identificador}  </td>

<td> ${voo.origem} </td>

<td> ${voo.destino}  </td>

<td> ${voo.capacidade} </td>

<td align="center"> ${voo.hora_partida} </td>

<td> ${voo.duracao} </td>
<td> ${voo.preco} </td>
<td> <a href="${spring:mvcUrl('VC#edita_voo').arg(0,voo.identificador).build()}"> Editar  </a> </td>
<td> <a href="${spring:mvcUrl('VC#remove_voo').arg(0,voo.identificador).build()}"> Remover  </a> </td>
</tr>


</c:forEach>
</table>

</body>
</html>