package com.ensa.front.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ensa.back.dto.Product;

//p0506
public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub

		Product product = (Product) target;
		//wheter file has been selected
		if(product.getFile() == null || product.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Veuillez selectionner une image !");
			return;
		}
		
		if(!(product.getFile().getContentType().equals("image/jpeg") ||
			 product.getFile().getContentType().equals("image/png")  ||
			 product.getFile().getContentType().equals("image/gif"))) {
			
			errors.rejectValue("file", null, "Veuillez entrer une image !");
			return;
		}
	}

}
