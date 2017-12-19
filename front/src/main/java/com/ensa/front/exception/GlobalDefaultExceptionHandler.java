package com.ensa.front.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;


//handle exception globally, annotate it with @controllerAdvice
@ControllerAdvice
public class GlobalDefaultExceptionHandler {

	//p0407 handle 404 error
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handlerNoHandlerFoundException() {
		
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "No page found !");
		mv.addObject("errorDescription", "The page you are requested is not here !");
		mv.addObject("title", "404 Error page");
		return mv;
	}
	//p0407 handle 500 error: product not found
	@ExceptionHandler(ProductNotFoundException.class)
	public ModelAndView handlerProductNotFoundException() {
		
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "Product not available !");
		mv.addObject("errorDescription", "The product you are requested is not available, contact us: support@achatcollectif.com !");
		mv.addObject("title", "Product unavailable");
		//return this to to PageController to handle this exception !
		return mv;
	}
	//p0407 handle global exception
	@ExceptionHandler(Exception.class)
	public ModelAndView handlerException(Exception ex) {
		
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "Oops !");
		mv.addObject("errorDescription", "Something went wrong ! details: "+ex.toString());
		mv.addObject("title", "Error");
		//return this to to PageController to handle this exception !
		return mv;
	}
}
