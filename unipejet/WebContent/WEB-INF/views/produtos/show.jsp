<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<customTags:page bodyClass="" title="">
	<ul class="clearfix">
<li><a href="${spring:mvcUrl('SCC#items').build()}"
rel="nofollow">Seu carrinho (${shoppingCart.quantity})
</a></li>
</ul>
	<article id="${produto.title}" itemscope
		itemtype="http://schema.org/Book">
		<header id="produto-highlight" class="clearfix">
			<div id="produto-overview" class="container">
				<img itemprop="image" width="280px" height="395px"
					src=''
					class="produto-featured-image" alt="${produto.title}">
				<h1 class="produto-title" itemprop="name">${produto.title}</h1>
				<p class="produto-author">
					<span class="produto-author-link"> ${produto.title} </span>
				</p>

				<p itemprop="description" class="book-description">
				${produto.description}
				 Veja o <a
						href="${produto.summaryPath}"
						target="_blank">sum&#225;rio</a> completo do livro!
				</p>
			</div>
		</header>


		<section class="buy-options clearfix">
			<form:form servletRelativeAction="/shopping" cssClass="container">
				<input type="hidden" value="${produto.id}" name="produtoId"/>
				<ul id="variants" class="clearfix">
					<c:forEach items="${produto.prices}" var="price">
						<li class="buy-option">
							
							<input type="radio"
							name="bookType" class="variant-radio" id="${produto.id}-${price.bookType}"
							value="${price.bookType}" ${price.bookType.name() == 'COMBO' ? 'checked' : ''}>
							 
							<label  class="variant-label" for="${produto.id}-${price.bookType}"> 
								${price.bookType}								
							</label> 
							<p class="variant-price">${price.value}</p>
						</li>
					</c:forEach>




				</ul>

				<input type="submit" class="submit-image icon-basket-alt"
					alt="Compre agora"
					title="Compre agora '${produto.title}'!" value="comprar"/>

			</form:form>

		</section>

		<div class="container">

			<section class="author produto-detail" itemprop="author" itemscope
				itemtype="http://schema.org/Person">
				<h2 class="section-title" itemprop="name">${produto.title}</h2>
				<span itemprop="description">

					<p class="book-description">${produto.description}</p>

				</span>
			</section>

			<section class="data produto-detail">
				<h2 class="section-title">Dados do livro:</h2>
				<p>
					Número de paginas: <span itemprop="numberOfPages">${produto.pages}</span>
				</p>


				<p></p>
				<p>
					Encontrou um erro? <a href='/submissao-errata' target='_blank'>Submeta
						uma errata</a>
				</p>
			</section>
		</div>


	</article>

</customTags:page>