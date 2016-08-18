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

<tbody>
<c:forEach items="${shoppingCart.list}" var="item">
<tr>
<td class="cart-img-col">
<img src="" alt="${item.product.title}"/>
</td>
<td class="item-title">
${item.product.title} - ${item.bookType}
</td>
<td class="numeric-cell">

${item.price}
</td>
<td class="quantity-input-cell">
<input type="number" min="0" readonly="readonly"
value="${shoppingCart.getQuantity(item)}">
</td>
<td class="numeric-cell">
${shoppingCart.getTotal(item)}
</td>
</tr>
</c:forEach>

</tbody>
<tfoot>
<tr>
<td colspan="2">
<form:form  ServeletRelativeAction="/payment/checkout" method="post">
<input type="submit" class="checkout"
name="checkout" value="Finalizar compra "
id="checkout"/>
</form:form>
</td>
<td class="numeric-cell">
${shoppingCart.total}
</td>
<td></td>
</tr>
</tfoot>



</body>
</html>