package br.com.unipejet.controllers;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import br.com.unipejet.daos.VoosDAO;
import br.com.unipejet.models.Compras;
import br.com.unipejet.models.ShoppingCart;
import br.com.unipejet.models.Voos;


@Transactional
@Controller
public class ComprasController {

	@Autowired
	private VoosDAO voosDAO;
	
	 Map<Compras, Integer> item;
	
	@Autowired
	private ShoppingCart shoppingCart;
	
	
	// Método que chama o formulario para definir o número de passagens 
	@RequestMapping("/compras/detalhes_compra")
	public ModelAndView detalhes_compra(Integer identificador){
	ModelAndView modelAndView = new ModelAndView("compras/detalhes_compra");
	Voos voo = voosDAO.find(identificador);
	modelAndView.addObject("voo", voo);
	return modelAndView;
	}

	
      // Método que chama o formulario para definir os passageiros
	@RequestMapping("/compras/define_passageiros")
	public ModelAndView define_passageiros(Integer identificador, double total, Integer passagens){
	ModelAndView modelAndView = new ModelAndView("compras/define_passageiros");
	Voos voo = voosDAO.find(identificador);
	modelAndView.addObject("total", total);
	modelAndView.addObject("passagens", passagens);
	modelAndView.addObject("voo", voo);
	return modelAndView;
	}


		

		// Método que adiciona os itens ao carrinho		
		@RequestMapping(value="/compras/carrinho",method=RequestMethod.POST)
		public ModelAndView add(Compras item){ 
		Calendar valor = Calendar.getInstance();
		Integer numero_compra = (int) valor.getTimeInMillis();	
		item.setNumero_compra(numero_compra);
		shoppingCart.add(numero_compra, item);
		return new ModelAndView("redirect:/voos/pesquisa_voo");
		}
		
			

		//Chama carrinho exibindo o seu contéudo
		@RequestMapping(value="/compras/itens")
		public String carrinho(){
		return "compras/ver_carrinho";
		}
		
		
		// Remove Item do carrinho
	 	@RequestMapping("compras/remove_item")
	 	public String remove_item(Integer id) {
        Map<Integer, Compras> objeto = shoppingCart.getItems();  
        objeto.remove(id); 
        return "compras/ver_carrinho";
	 	}
		
	 	
	 	//Chamando página de pagamento
	 	@RequestMapping("compras/pagamento")
		public ModelAndView realizar_pagamento(){
		ModelAndView modelAndView = new ModelAndView("compras/realizar_pagamento");
		return modelAndView;

		}
	 	
		
	 	
	 	
	 	
	 	
	}
	 
	 

