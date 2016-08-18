<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<h2> Resumo Geral da Compra </h2>
<tbody>
<c:set var="total" value="0"/>
<table>
<form:form servletRelativeAction="/compras/pagamento" method="post"  commandName="">
<c:forEach items="${shoppingCart.list }" var="item" varStatus="contador">
<h3> 
<tr> <td colspan="3"> <strong> Compra ${contador.index + 1} </strong></td> </tr>
<tr>
<th> Voo </th>
<th> Passagens </th>
<th> Valor  <c:set var="id" value="${item.numero_compra}"/></th>
</tr>
<c:set var="total" value="${total + item.total}"/>
<tr>
<td>  ${item.identificador}  </td>
<td>  ${item.passagens}     </td>
<td>  ${item.total }        </td> 
<td> <a href="${spring:mvcUrl('CC#remove_item').arg(0,id).build()}"> remover  </a> </td>
</tr>

<tr> <td>  Passageiros </td> </tr>

<c:forEach items="${item.passageiros}" var="passageiro">

<tr>
<td> ${passageiro.nome } </td>

</tr>
<tr><td>&nbsp; </td></tr>
</c:forEach>
</c:forEach>
<tr><td> <input name="total" value="${total}" type="text" disabled/>  </td> </tr>
<tr> <td>

<input type="submit" value="Efetuar Pagamento"/>
<td> </tr>
</form:form>
</table>


</body>
</html>