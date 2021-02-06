package gr.hua.dit.ds.group24.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gr.hua.dit.ds.group24.DAO.AppointmentDAO;
import gr.hua.dit.ds.group24.DAO.AuthoritiesDAO;
import gr.hua.dit.ds.group24.DAO.PublicServiceDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.DAO.UserDetailsDao;
import gr.hua.dit.ds.group24.entity.Appointment;
import gr.hua.dit.ds.group24.entity.User;
import gr.hua.dit.ds.group24.service.EntitiesService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	private PublicServiceDAO psDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AuthoritiesDAO authDAO;
	
	@Autowired
	private AppointmentDAO appDAO;
	
	@Autowired
	private EntitiesService entitiesService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping("")
	public String menu(Model model) {
		model.addAttribute("pageTitle", "Employee Menu");
		return "employee/employee-menu";
	}
	
	@RequestMapping("/request-list")
	public String listRequests(Model model, Authentication auth) {
		model.addAttribute("pageTitle", "Request List");
		User employee = userDAO.getUserByUsername(auth.getName());
		
		List<Appointment> requests = appDAO.getRequests(employee.getPs().getId());
		
		model.addAttribute("requests", requests);
		return "employee/request-list";
	}
	
	@RequestMapping("/set-date")
	public String setAppoitnmentDate(Model model) {
		model.addAttribute("pageTitle", "Set Appointment Date");
		
		
		return "employee/set-date";
	}
}
