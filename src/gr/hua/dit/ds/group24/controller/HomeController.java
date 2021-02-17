package gr.hua.dit.ds.group24.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gr.hua.dit.ds.group24.DAO.AuthoritiesDAO;
import gr.hua.dit.ds.group24.DAO.PublicServiceDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.entity.PublicService;
import gr.hua.dit.ds.group24.entity.User;
import gr.hua.dit.ds.group24.service.EntitiesService;

@Controller
@RequestMapping("/")
public class HomeController {
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
	public String showmainpage(Model model) {
		model.addAttribute("pageTitle", "home");
	    return "index";
	}
	
	@GetMapping("/login")
	public String showLogin(Model model) {
		model.addAttribute("pageTitle", "login");
		return "login";
	}
	
	@GetMapping("/submission")
	public String submissionPs(Model model) {
		model.addAttribute("pageTitle", "new submission");
		return "submission-form";
	}
	
	@PostMapping("/submission")
	public String savePs(Model model, @ModelAttribute("publicservice") PublicService ps, @ModelAttribute("user") User user) {
		if(ps.getName().trim().length()<3) {
			model.addAttribute("pageTitle", "new submission (error)");
			model.addAttribute("inputError", true);
			return "submission-form";
		}else if(user.getUsername().trim().length()<3 || user.getPassword().trim().length()<4) {
			model.addAttribute("pageTitle", "new submission (error)");
			model.addAttribute("inputError2", true);
			return "submission-form";
		}
		PublicService ps1 = new PublicService(ps.getName(), ps.getAddress(), ps.getAppointmentRoom(), false, ps.getSchedule(), ps.getPostcode(),ps.getCallCenter());
		User user1 = new User(user.getUsername(), encoder.encode(user.getPassword()), true, user.getFullname(), "User", user.getEmail(), ps1);
		entitiesService.savePublicServiceUser(ps1,user1);
		return "redirect:/";
	}
	
	@GetMapping("/user")
	public String user(Model model, Principal principal) {
		model.addAttribute("pageTitle", "user info");
		model.addAttribute("user", userDAO.getUserByUsername(principal.getName()));
		return "user";
	}
	
	@GetMapping("/admin")
	public String admin(Model model) {
		model.addAttribute("pageTitle", "admin");
		List<User> users =  userDAO.getUsers();
		model.addAttribute("users", users);
		return "admin-page";
	}
	
	@GetMapping("/user-manual")
	public String userManual(Model model) {
		model.addAttribute("pageTitle", "User Manual");
		return "user-manual";
	}
}