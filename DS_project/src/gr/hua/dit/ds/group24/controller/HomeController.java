package gr.hua.dit.ds.group24.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@GetMapping("/login")
	public String showLogin() {
		return "login";
	}
	
	@RequestMapping("")
	public String showmainpage() {
	        return "index";
	}
	
	@GetMapping("/submission")
	public String submission() {
		return "submission-form";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "temp";
	}
	
	
//	@RequestMapping("/processFormv2")
//	public String processFormv2(HttpServletRequest request, Model model) {
//	   String theName = request.getParameter("studentName");
//	   theName = theName.toUpperCase();
//	   String result ="Hello " + theName;
//	   model.addAttribute("message",result);
//	   return "helloworld";
//	}
	
	
}
