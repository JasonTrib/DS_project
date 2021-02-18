package gr.hua.dit.ds.group24.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gr.hua.dit.ds.group24.DAO.PublicServiceDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.entity.Authorities;
import gr.hua.dit.ds.group24.entity.PublicService;
import gr.hua.dit.ds.group24.entity.User;
import gr.hua.dit.ds.group24.service.EntitiesService;

@Controller
@RequestMapping("/supervisor")
public class SupervisorController {
	@Autowired
	private PublicServiceDAO psDAO;
	
	@Autowired
	private UserDAO userDAO;

	@Autowired
	private EntitiesService entitiesService;
	
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
		User thisUser = userDAO.getUserByUsername(authent.getName());
		List<User> employees;
		if(thisUser.getTitle().equals("Admin")) {
			employees = userDAO.getEmployees();
		}else {
			employees = userDAO.getEmployees(thisUser.getPs().getId());
		}
        model.addAttribute("employees",employees);
		return "supervisor/list-employees";
	}

	@GetMapping("/deleteEmployee")
	public String deleteEmployee(Model model, @RequestParam("username") String username) {
		userDAO.deleteUser(username);
		return "redirect:/supervisor/employees";
	}
	
	@GetMapping("/employee/edit")
	public String editEmployee(Model model,@RequestParam("username") String username) {
		model.addAttribute("pageTitle", "edit employee");
		User employee =  userDAO.getUserByUsername(username);
		model.addAttribute(employee);
		return "supervisor/edit-employee-form";
	}
	
	@PostMapping("/editEmployeeForm")
	public String editEmployeeForm(Model model, @ModelAttribute("user") User e) {
		userDAO.updateUser(e);
		return "redirect:/supervisor/employees";
	}
	
	@PostMapping("/createEmployeeForm")
	public String createEmployeeForm(Model model, @RequestParam(value="psid", required=false) Integer psid, @ModelAttribute("user") User e, Authentication authent) {
		if(userDAO.getUserByUsername(e.getUsername())!=null) {
			model.addAttribute("pageTitle", "create employee (error)");
			model.addAttribute("inputError", true);
			return "supervisor/create-employee-form";
		}else if(e.getUsername().trim().length()<3 || e.getPassword().trim().length()<3) {
			model.addAttribute("pageTitle", "create employee (error)");
			model.addAttribute("inputError2", true);
			return "supervisor/create-employee-form";
		}
		User thisUser = userDAO.getUserByUsername(authent.getName());
		User employee;
		if(thisUser.getTitle().equals("Admin")) {
			PublicService ps;
			try {
				ps = psDAO.getPublicService(psid);
			}catch(Exception ex) {
				model.addAttribute("pageTitle", "create employee (error)");
				model.addAttribute("inputError3", true);
				return "supervisor/create-employee-form";
			}
			employee = new User(e.getUsername(), encoder.encode(e.getPassword()), true, e.getFullname(), "Employee", e.getEmail(), ps);
		}else {
			employee = new User(e.getUsername(), encoder.encode(e.getPassword()), true, e.getFullname(), "Employee", e.getEmail(), thisUser.getPs());
		}
		Authorities auth = new Authorities("ROLE_EMPLOYEE",employee);
		entitiesService.saveUserAuthorities(employee,auth);
		return "redirect:/supervisor";
	}
	
	@RequestMapping("/employee/create")
	public String createEmployee(Model model) {
		model.addAttribute("pageTitle", "create employee");
		return "supervisor/create-employee-form";
	}

	@RequestMapping("/selectPs")
	public String selectPs(Model model) {
		model.addAttribute("pageTitle", "select public service");
		return "supervisor/selectps";
	}

	@PostMapping("/editPsForm")
	public String editPsForm2(Model model, @RequestParam(value="id", required=false) Integer id) {
		PublicService publicservice;
		try {
			publicservice = psDAO.getPublicService(id);
		} catch(Exception ex) {
			model.addAttribute("pageTitle", "edit");
			model.addAttribute("inputError2", true);
			return "supervisor/selectps";
		}
		model.addAttribute("publicservice", publicservice);
		return "supervisor/publicservices-edit";
	}

	@RequestMapping("/editPs")
	public String editPservice(Model model, Authentication auth) {
		model.addAttribute("pageTitle", "edit public service");
		User supervisor = userDAO.getUserByUsername(auth.getName());
		PublicService publicservice = psDAO.getPublicService(supervisor.getPs().getId());
		model.addAttribute("publicservice", publicservice);
		return "supervisor/publicservices-edit";
	}

	@PostMapping("/editPublicServicesForm")
	public String editPsForm(Model model, @ModelAttribute("publicservice") PublicService ps) {
		model.addAttribute("pageTitle", "edit public service");
		psDAO.updatePublicService(ps);
		return "redirect:/supervisor";
		}
}
