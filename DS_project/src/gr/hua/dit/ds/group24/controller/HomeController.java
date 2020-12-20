package gr.hua.dit.ds.group24.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import gr.hua.dit.ds.group24.DAO.EmployeeDAO;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@RequestMapping("/hi")
	public String test() {
		
		System.out.println("loaded /hi");
		
		return "hello";
	}
	
	@Autowired
    private EmployeeDAO employeeDAO;
    
    @RequestMapping("/create")
    public String newEmployee(Model model) {
    	
            employeeDAO.createEmployee();
            
            return "hello";
    }
}
