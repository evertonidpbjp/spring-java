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


${sucesso}

<sec:authorize access="hasRole('ROLE_ADMIN')">
<li><a href="${spring:mvcUrl('PC#form').arg(0,produto.id).build()}">Cadastrar novo produto</a></li>
</sec:authorize>

<table>
<tr>
<td>Titulo</td>
<td>Valores</td>

</tr>
<c:forEach items="${produtos}" var="produto">
<tr>
<td>

<a
href="${spring:mvcUrl('PC#show').arg(0,produto.id).build()}">

${produto.title}

</a>

</td>
<td>
<c:forEach items="${produto.prices}"
var="price">
[${price.value} - ${price.bookType}]
</c:forEach>
</td>


</tr>
</c:forEach>
</table>

</body>
</html>