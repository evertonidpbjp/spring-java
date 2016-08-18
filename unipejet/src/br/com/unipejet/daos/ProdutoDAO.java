package br.com.unipejet.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import br.com.unipejet.models.BookType;
import br.com.unipejet.models.Produto;

	@Transactional
	@Repository
	public class ProdutoDAO {

	@PersistenceContext
	private EntityManager manager;

	public void save(Produto produto){
	manager.persist(produto);
	}


	public List<Produto> list() {
	return manager.createQuery("select distinct(p) from Produto p join fetch p.prices",Produto.class)
	.getResultList();
	}


	public Produto find(Integer id) {
		TypedQuery<Produto> query = manager
				.createQuery(
						"select distinct(p) from Produto p join fetch p.prices where p.id=:id",
						Produto.class).setParameter("id", id);
		return query.getSingleResult();
	}

	public Produto findBy(Integer id, BookType bookType) {
		TypedQuery<Produto> query = manager
				.createQuery(
						"select p from Product p join fetch p.prices price where p.id = :id and price.bookType = :bookType",
						Produto.class);
		query.setParameter("id", id);
		query.setParameter("bookType", bookType);
		return query.getSingleResult();
	}


	
	
	}

