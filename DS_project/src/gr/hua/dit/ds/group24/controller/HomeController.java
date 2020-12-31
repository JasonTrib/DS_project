package gr.hua.dit.ds.group24.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gr.hua.dit.ds.group24.DAO.AuthoritiesDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.DAO.UserDetailsDao;
import gr.hua.dit.ds.group24.entity.User;
import gr.hua.dit.ds.group24.service.UserService;

@Controller
@RequestMapping("/")
public class HomeController {
	
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
	
	@GetMapping("/login")
	public String showLogin(Model model) {
		model.addAttribute("pageTitle", "login");
		return "login";
	}
	
	@RequestMapping("")
	public String showmainpage(Model model) {
		model.addAttribute("pageTitle", "home");
	        return "index";
	}
	
	@GetMapping("/submission")
	public String submission(Model model) {
		model.addAttribute("pageTitle", "submission form");
		return "submission-form";
	}
	
	@GetMapping("/admin")
	public String admin(Model model) {
		model.addAttribute("pageTitle", "admin");
		
		List<User> users =  userDAO.getUsers();
		model.addAttribute("users", users);
		
		return "admin-page";
	}
	
	@RequestMapping("/403")
	public String status403error(Model model) {
		model.addAttribute("pageTitle", "403 Forbidden");
	        return "status/error403";
	}
	
}
	

