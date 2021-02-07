package gr.hua.dit.ds.group24.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gr.hua.dit.ds.group24.DAO.AuthoritiesDAO;
import gr.hua.dit.ds.group24.DAO.PublicServiceDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.entity.Authorities;
import gr.hua.dit.ds.group24.entity.PublicService;
import gr.hua.dit.ds.group24.entity.User;
import gr.hua.dit.ds.group24.service.EntitiesService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
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
	public String menu(Model model) {
		model.addAttribute("pageTitle", "manager menu");
		return "manager/manager-menu";
	}
	
	@RequestMapping("/supervisors")
	public String listsupervisors(Model model) {
		model.addAttribute("pageTitle", "supervisors");
		List<User> supervisors = userDAO.getSupervisors();
		model.addAttribute("supervisors", supervisors);
		return "manager/list-supervisors";
	}
	
	@RequestMapping("/public_services")
	public String listpservice(Model model) {
		model.addAttribute("pageTitle", "public services");
		List<PublicService> ps = psDAO.getPublicServices();
		model.addAttribute("ps", ps);
		return "manager/list-pservice";
	}
	
	@RequestMapping("/submissions")
	public String listsubmissions(Model model) {
		model.addAttribute("pageTitle", "submissions");
		List<User> submissions = userDAO.getSubmissions();
		model.addAttribute("submissions", submissions);
		return "manager/list-submissions";
	}
	
	@GetMapping("/supervisors/edit")
	public String editsv(Model model, @RequestParam(name="username") String username) {
		model.addAttribute("pageTitle", "edit supervisors");
		User user  = userDAO.getUserByUsername(username);
		model.addAttribute(user);
		return "manager/supervisors-edit";
	}
	
	@PostMapping("/supervisors/editForm")
	public String editSupervisorForm(Model model, @ModelAttribute("user") User user) {
		if(user.getPassword().trim().length()<3) {
			model.addAttribute("pageTitle", "edit supervisors");
			model.addAttribute("inputError", true);
			return "manager/supervisors-edit";
		}
		user.setPassword(encoder.encode(user.getPassword()));
		userDAO.updateUser(user);
		return "redirect:/manager/supervisors";	
	}
	
	@GetMapping("/delete-publicservice")
	public String deleteps(@RequestParam("id") Integer id) {
		entitiesService.deletePublicServiceAppointment(id);
//		psDAO.deletePublicService(id);
		return "redirect:/manager/public_services";
	}
	
	@GetMapping("/accept-submission")
	public String acceptsm(@RequestParam("username") String username) {
		User user = userDAO.getUserByUsername(username);
		entitiesService.acceptSubmission(user.getPs(),user);
		return "redirect:/manager/submissions";
	}
	
	@GetMapping("/reject-submission")
	public String rejectsm(@RequestParam("id") Integer id) {
		psDAO.rejectSubmission(id);
		return "redirect:/manager/submissions";
	}
	
}	