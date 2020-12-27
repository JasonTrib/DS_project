package gr.hua.dit.ds.group24.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@RequestMapping("")
	public String showfirstpage() {
	        return "temp";
	}
	
}
