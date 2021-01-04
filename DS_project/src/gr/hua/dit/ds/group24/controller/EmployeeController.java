package gr.hua.dit.ds.group24.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import gr.hua.dit.ds.group24.DAO.AuthoritiesDAO;
import gr.hua.dit.ds.group24.DAO.PublicServiceDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.DAO.UserDetailsDao;
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
	private EntitiesService entitiesService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping("")
	public String showfirstpage() {
	        return "temp";
	}
	
}
