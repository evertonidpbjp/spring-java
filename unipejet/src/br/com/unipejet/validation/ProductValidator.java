package br.com.unipejet.validation;


import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.unipejet.models.Produto;

public class ProductValidator implements Validator{

	@Override
public void validate(Object target, Errors errors) {
ValidationUtils.rejectIfEmptyOrWhitespace(errors,
"title", "field.required");
ValidationUtils.rejectIfEmptyOrWhitespace(errors,
"description", "field.required");
Produto produto = (Produto) target;

if(produto.getPages() == 0){
errors.rejectValue("pages", "field.required");
}
}
	
	

	@Override
	public boolean supports(Class<?> clazz) {
	return Produto.class.isAssignableFrom(clazz);
	}
}