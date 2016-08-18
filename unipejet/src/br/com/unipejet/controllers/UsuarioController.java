package br.com.unipejet.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import br.com.unipejet.daos.UserDAO;
import br.com.unipejet.models.BookType;
import br.com.unipejet.models.Produto;
import br.com.unipejet.models.Role;
import br.com.unipejet.models.User;
import br.com.unipejet.models.Voos;
import br.com.unipejet.teste.TestaConexao;
import br.com.unipejet.validation.UserValidator;



@Controller
@Transactional
public class UsuarioController {

	@Autowired
	private UserDAO userDAO;
	

	
	//Método que chama o formulario de login
	@RequestMapping("/login")
	public String loginPage(){
		return "auth/login";
	}
	
	
	
	// Método que chama o formulario de cadastro
	@RequestMapping("/cadastro")
	public ModelAndView cadastroPage(User user){
	ModelAndView modelAndView = new ModelAndView("auth/cadastro");
	return modelAndView;
	}
	

	//Método que chama o formulario de login
	@RequestMapping("/")
	public String homePage(){
	
		return "auth/home";
	}
	
	
	
	
	
	
    // Método que efetivamente cadastra os usuários (falta melhorar o validação de campos CPF e RG)
	
	@RequestMapping(value="/cadastrar",method=RequestMethod.POST)
	public ModelAndView save(@Valid User user, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) throws SQLException{
		       
		if(bindingResult.hasErrors()){
			return cadastroPage(user);
			
		}
		
          // Criptografando a senha antes de armazenar no banco
		    String senha = user.getPassword();
	        BCryptPasswordEncoder senhaBCrypt = new BCryptPasswordEncoder();
	        senha  = senhaBCrypt.encode(senha);
		    user.setPassword(senha);
	        user.setSenha_testa(senha);
		  // Gerando um número qualquer para o cartao de milhas  
		    
		    Calendar valor = Calendar.getInstance();
		    long cartao_milhas = valor.getTimeInMillis();
		    user.setCartao_milha(cartao_milhas);
	
	
		    userDAO.save(user);
            
		
              		    
		    redirectAttributes.addFlashAttribute("sucesso", "Usuário cadastrado com sucesso");
	              
	        return new ModelAndView("redirect:cadastro");
		
	
	}
	
	
	  // Faz a listagem de todos os usuários cadastrados
	   @RequestMapping(value = "/listar", method=RequestMethod.GET)
	   public ModelAndView list(){
	   ModelAndView modelAndView = new ModelAndView("auth/lista_usuarios");
	   modelAndView.addObject("users", userDAO.lista());
	   return modelAndView;
	   }
	
	  // Chama a página de Edição de um usuário específico
	 
       @RequestMapping("/editar")
	   public ModelAndView edita(String login){
	   ModelAndView modelAndView =
	   new ModelAndView("auth/edita_usuario");
	   User user = userDAO.find(login);
	   modelAndView.addObject("user", user);
	   return modelAndView;
	   }
	
	   
       
       // Efetua a edição de um usuário específico
       @RequestMapping(value="/efetuar_alteracao",method=RequestMethod.POST)
   	public ModelAndView efetuar_alteracao(@Valid User user, BindingResult bindingResult,
   			RedirectAttributes redirectAttributes){
   		  
    	   
   		if(bindingResult.hasErrors()){
   	         
   			
   			
   			return edita(user.getLogin());
   	
   		 
   		
   		}
   		
   		  String senha_testa  = user.getSenha_testa(); 
   		  String password = user.getPassword();
          if (senha_testa.equals(password)){
        	  
  	       
  		    user.setPassword(senha_testa);
            user.setSenha_testa(senha_testa);
        	  
          }
   		
          else 
          {
        	  BCryptPasswordEncoder senhaBCrypt = new BCryptPasswordEncoder();
    	      password  = senhaBCrypt.encode(password);
    	      user.setPassword(password);
              user.setSenha_testa(password);
          }
   		    user.setRole("ROLE_COMPRADOR");
   		    userDAO.altera(user);
          
   		    redirectAttributes.addFlashAttribute("sucesso", "Usuário editado com sucesso");
   	              
   	        return new ModelAndView("redirect:listar");
   		
   	
   	}
   	
       
   	
   	// Remove usuario cadastrado
    	@RequestMapping("/remove_usuario")
    	public String remove_usuario(String login) {
    	
    		
        User user = userDAO.find(login);
        userDAO.remove(user);
        return "redirect:/listar";
    	}
	   
       
	   
	   
	
/*
	  Usando validações mais básicas
	  
	  @InitBinder // indica que esse método será chamado para validação, o método abaixo aponta para a classe que fará a validaçã, no caos o UserValidator
	  protected void initBinder(WebDataBinder binder) {
	  binder.setValidator(new UserValidator());
	  }
	  
*/
	
	
	/* Tentando modificar a data com ajax (não deu certo)
	
		@RequestMapping("converteData")
		public void finaliza(String data, HttpServletResponse response) throws IOException {
			response.getWriter().write("Valeu");
			response.setStatus(200);
			
		}
		
*/
		
		
		

	
}
