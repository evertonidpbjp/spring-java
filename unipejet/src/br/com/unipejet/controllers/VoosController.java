package br.com.unipejet.controllers;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.unipejet.daos.VoosDAO;
import br.com.unipejet.models.Produto;
import br.com.unipejet.models.User;
import br.com.unipejet.models.Voos;

@Transactional
@Controller
public class VoosController {

	@Autowired
	private VoosDAO voosDAO;
	
	
	// Método que chama o formulario de cadastro de voos
	@RequestMapping("/voos/cad_voos")
	public ModelAndView cadastroVoos(Voos voo){
	ModelAndView modelAndView = new ModelAndView("voos/cadastro_voos");
	return modelAndView;
	}
	
	
	// Cadastra Voo
	@RequestMapping(value="/voos/salvar_voos",method=RequestMethod.POST)
	public ModelAndView save(@Valid Voos voo, BindingResult bindingResult,
			RedirectAttributes redirectAttributes){
		       
		if(bindingResult.hasErrors()){
			return cadastroVoos(voo);
			
		}
		  
		// Ajustes, antes de gravar no banco
		    voo.setAssentos(voo.getCapacidade());
		  
		    
		        String  valor = voo.getData();
		        String data = valor.replaceAll("-", "/");
		        String[] s = data.split("/");
		        String novaData = s[2]+"/"+s[1]+"/"+s[0];
		        voo.setData(novaData);
		        System.out.println(novaData);
		    
		    
		    
		    voosDAO.save(voo);
       
		    redirectAttributes.addFlashAttribute("sucesso", "Voo cadastrado com sucesso");
	              
	        return new ModelAndView("redirect:/voos/cad_voos");
		
	
	}
	
	
	 
	// Faz a listagem de todos os voos cadastrados
	  
	@RequestMapping(value = "/voos/listar_voos", method=RequestMethod.GET)
	   public ModelAndView list_voo(){
	   ModelAndView modelAndView = new ModelAndView("voos/lista_voos");
	   System.out.println("Testando");
	   modelAndView.addObject("voos", voosDAO.lista());
	   return modelAndView;
	   }
	
	  
	
	// Chama a página de Edição de um voo específico
	 
    @RequestMapping("/voos/edita_voo")
	   public ModelAndView edita_voo(Integer identificador){
	   ModelAndView modelAndView =
	   new ModelAndView("voos/edita_voo");
	   Voos voo = voosDAO.find(identificador);
	   modelAndView.addObject("voo", voo);
	   return modelAndView;
	   }
	
	   
    
     
     // Realiza a edição do voo
     
     @RequestMapping(value="/voos/altera_voo",method=RequestMethod.POST)
 	public ModelAndView altera_voo(@Valid Voos voo, BindingResult bindingResult,
 			RedirectAttributes redirectAttributes){
 		  
  	   
 		if(bindingResult.hasErrors()){
 	         
 			
 			
 			return edita_voo(voo.getIdentificador());
 	
 		 
 		
 		}
 		
      
 		    voosDAO.altera(voo);
        
 		    redirectAttributes.addFlashAttribute("sucesso", "Voo editado com sucesso");
 	              
 	        return new ModelAndView("redirect:/voos/listar_voos");
 		
 	
 	}
	
	
	// Remove voo cadastrado
 	@RequestMapping("voos/remove_voo")
 	public String remove_voo(Integer identificador) {
 	
     Voos voo = voosDAO.find(identificador);
     voosDAO.remove(voo);
     return "redirect:/voos/listar_voos";
 	}
 	



	 // Pesquisa Voo que atenda aos valores de origem e destino informados
    @RequestMapping("/voos/pesquisa_voo")
	   public ModelAndView pesquisa_voo(String origem, String destino, String data){
    	
    System.out.println(origem + destino + data);
    	

    ModelAndView modelAndView =
	   new ModelAndView("voos/pesquisa_voo");
    
        if(origem == "") origem = null;
    
        if(data != null && origem != null && destino != null){
         
 
        	String  valor = data;
            String datas = valor.replaceAll("-", "/");
            String[] s = datas.split("/");
            String nova_data = s[2]+"/"+s[1]+"/"+s[0];	
            List<Voos> voos = voosDAO.buscaVoo(origem, destino, nova_data);
	        System.out.println(nova_data);
	        modelAndView.addObject("voos", voos);
	  }
	 
        else {
        	
        	modelAndView.addObject("voos", voosDAO.lista());
        }
        
         return modelAndView;
	   
    }

    
	// Método que chama o formulario de Compra 
	@RequestMapping("/voos/comprar_voos")
	public ModelAndView comprar_voo(Integer identificador){
	ModelAndView modelAndView = new ModelAndView("voos/comprar_voos");
	return modelAndView;
	}


	
	
	
}
		
		
	
	

