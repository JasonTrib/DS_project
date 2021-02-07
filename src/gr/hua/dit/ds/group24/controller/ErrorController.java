package gr.hua.dit.ds.group24.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {

	@GetMapping("/errors")
	public String renderErrorPage(Model model, HttpServletRequest httpRequest) {
		String errorMsg = "";
		int httpErrorCode = getErrorCode(httpRequest);
		switch (httpErrorCode) {
		case 400:
			errorMsg = "400 - Bad request.";
			break;
		case 401:
			errorMsg = "401 - Unauthorized.";
			break;
		case 403:
			errorMsg = "403 - Access is forbidden.";
			break;
		case 404:
			errorMsg = "404 - Target resource is not available.";
			break;
		case 500:
			errorMsg = "500 - Internal server error. Sorry for the inconvenience.";
			break;
		default:
			return "redirect:/";
		}
		model.addAttribute("pageTitle", "error");
		model.addAttribute("errorMsg", errorMsg);
		return "error-page";
	}
	
    public int getErrorCode(HttpServletRequest httpRequest) {
    	try {
    		return (Integer) httpRequest.getAttribute("javax.servlet.error.status_code");
    	}catch(Exception e) {
    		return 0;
    	}
    }
    
}