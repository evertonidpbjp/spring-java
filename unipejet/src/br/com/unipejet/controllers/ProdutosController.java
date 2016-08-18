package br.com.unipejet.controllers;



import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.unipejet.daos.ProdutoDAO;
import br.com.unipejet.infra.FileSaver;
import br.com.unipejet.models.BookType;
import br.com.unipejet.models.Produto;
import br.com.unipejet.validation.ProductValidator;

@Controller
public class ProdutosController {
    
	@Autowired
	private ProdutoDAO produtoDAO; 
	
	@Autowired
	private FileSaver fileSaver;
	
	/*
  @RequestMapping(value="/produtos",method=RequestMethod.POST)
	public String Save(@Valid Produto produto,BindingResult bindingResult, RedirectAttributes red){
	  if(bindingResult.hasErrors()){
		  return form(red);
		  }
	   System.out.println("Cadastrando produtos" + produto);
		produtoDAO.save(produto);
		red.addFlashAttribute("sucesso", "Cadastro Realizado com Sucesso");
		return "redirect:produtos";
		
	 }
 
  */
	
	
@RequestMapping(value="/produtos",method=RequestMethod.POST)
@CacheEvict(value="books", allEntries=true)	
public ModelAndView save(MultipartFile summary, @Valid Produto produto, BindingResult bindingResult,
	RedirectAttributes redirectAttributes){
		if(bindingResult.hasErrors()){
			return form(produto);
			}
	
	
		String webPath = fileSaver.write("uploaded-images",summary);
				produto.setSummaryPath(webPath);
	            produtoDAO.save(produto);
	redirectAttributes.addFlashAttribute("sucesso",
	"Produto cadastrado com sucesso");
	return new ModelAndView("redirect:produtos");
	}
	
	
	/* o método Initbinder serve para validações básicas 
	
  @InitBinder // indica que esse método será chamado para validação, o método abaixo aponta para a classe que fará a validaçã, no caos o ProductValidator
  protected void initBinder(WebDataBinder binder) {
  binder.setValidator(new ProductValidator());
  }
  
  */
  /*
   @RequestMapping("/produtos/form")
   public String form(Model model){
	   model.addAttribute("types", BookType.values());
	   return "produtos/form";
	   }
  */
  
  
	@RequestMapping("/produtos/form")
	public ModelAndView form(Produto produto){
	ModelAndView modelAndView =
	new ModelAndView("produtos/form");
	modelAndView.addObject("types", BookType.values());
	return modelAndView;
	}
	

	

   @RequestMapping(value = "/produtos", method=RequestMethod.GET)
   @Cacheable(value="books")
   public ModelAndView list(){
   ModelAndView modelAndView = new ModelAndView("produtos/list");
   modelAndView.addObject("produtos", produtoDAO.list());
   return modelAndView;
   }
   
   /*
    @RequestMapping(value="/produtos",method=RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("produtos/list");
		modelAndView.addObject("produtos", produtoDAO.list());
		return modelAndView;
	}

*/
   
   
   @RequestMapping("/{id}")
   public ModelAndView show(@PathVariable("id") Integer id){
   ModelAndView modelAndView =
   new ModelAndView("produtos/show");
   Produto produto = produtoDAO.find(id);
   modelAndView.addObject("produto", produto);
   return modelAndView;
   }
   
   
   /* Usando o @responseBody que permite que o retorno do método já seja o corpo da resposta, em vez de 
    * retornar uma página (que é comportamento padrão
   @RequestMapping(method = RequestMethod.GET,value="json")
   @ResponseBody
   public List<Product> listJson() {
   return products.list();
   }
   */
}

