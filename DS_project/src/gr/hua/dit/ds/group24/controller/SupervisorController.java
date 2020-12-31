package gr.hua.dit.ds.group24.controller;

import java.security.Principal;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gr.hua.dit.ds.group24.DAO.AuthoritiesDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.DAO.UserDetailsDao;
import gr.hua.dit.ds.group24.entity.Authorities;
import gr.hua.dit.ds.group24.entity.User;
import gr.hua.dit.ds.group24.service.UserService;

@Controller
@RequestMapping("/supervisor")
public class SupervisorController {
	
	@Autowired
    public UserDAO userDAO;
	
	@Autowired
	public UserDetailsDao userDetailsDAO;
	
	@Autowired
	public AuthoritiesDAO authoritiesDAO;
	
	@Autowired
	public UserService userService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping("")
	public String showfirstpage(Model model) {
		model.addAttribute("pageTitle", "supervisor menu");
		
		return "supervisor/supervisor-menu";
	}
	
	@RequestMapping("/employees")
	public String listEmployees(Model model,Authentication authent) {
		model.addAttribute("pageTitle", "employee list");
		//get logged-in user
		User thisUser = userDAO.getUserByUsername(authent.getName());
		List<User> employees;
		if(thisUser.getTitle().equals("Admin")) {
			//get all customers
			employees = userDAO.getEmployees();
		}else {
			//get customers with corresponding psid
	        employees = userDAO.getEmployees(thisUser.getPsid());
		}
        // add the customers to the model
        model.addAttribute("employees",employees);
        
		return "supervisor/view-employees";
	}


	@GetMapping("/deleteEmployee")
	public String deleteEmployee(Model model, @RequestParam("username") String username) {
		userDAO.deleteUser(username);

		return "redirect:/supervisor";
	}
	
	@GetMapping("/editEmployee")
	public String editEmployee(Model model,@RequestParam("username") String username) {
		model.addAttribute("pageTitle", "edit employee");
		
		User employee =  userDAO.getEmployee(username);
		model.addAttribute(employee);
		
		return "supervisor/edit-employee-form";
	}
	
	@PostMapping("/editEmployeeForm")
	public String editEmployeeForm(Model model, @ModelAttribute("user") User e) {
		
		if(e.getPassword().trim().length()<3) {
			model.addAttribute("pageTitle", "edit employee");
			model.addAttribute("inputError", true);
			return "supervisor/edit-employee-form";
		}
		
		User employee = new User(e.getUsername(),encoder.encode(e.getPassword()),e.getFullname(),e.getEmail());
		System.out.println("altered employee:"+employee.toString());
		userDAO.updateEmployee(employee);
		
		return "redirect:/supervisor";
	}
	
	@PostMapping("/createEmployeeForm")
	public String createEmployeeForm(Model model, @ModelAttribute("user") User e, Authentication authent) {
		
		User thisUser = userDAO.getUserByUsername(authent.getName());
		
		if(e.getUsername().trim().length()<3 || e.getPassword().trim().length()<3) {
			model.addAttribute("pageTitle", "create employee");
			model.addAttribute("inputError", true);
			return "supervisor/create-employee-form";
		}
		
		User employee;
		if(thisUser.getTitle().equals("Admin")) {
			employee = new User(e.getUsername(), encoder.encode(e.getPassword()), true, e.getFullname(), "Employee", e.getEmail(), e.getPsid());
		}else {
			employee = new User(e.getUsername(), encoder.encode(e.getPassword()), true, e.getFullname(), "Employee", e.getEmail(), thisUser.getPsid());
		}
		Authorities auth = new Authorities("ROLE_EMPLOYEE",employee);
		//employee.setAuthorities((Set<Authorities>)new HashSet<>(Arrays.asList(auth)));
		userService.saveUserAuthorities(employee,auth);
		
		return "redirect:/supervisor";
	}
	
	@RequestMapping("/createEmployee")
	public String createEmployee(Model model) {
		model.addAttribute("pageTitle", "create employee");

		return "supervisor/create-employee-form";
	}
	
}
