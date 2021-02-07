package gr.hua.dit.ds.group24.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import gr.hua.dit.ds.group24.DAO.AppointmentDAO;
import gr.hua.dit.ds.group24.DAO.AuthoritiesDAO;
import gr.hua.dit.ds.group24.DAO.PublicServiceDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.DAO.UserDetailsDao;
import gr.hua.dit.ds.group24.entity.Appointment;
import gr.hua.dit.ds.group24.entity.PublicService;
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
	private AppointmentDAO appointDAO;
	
	@Autowired
	private EntitiesService entitiesService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping("")
	public String menu(Model model) {
		model.addAttribute("pageTitle", "employee menu");
		return "employee/employee-menu";
	}
	
	@RequestMapping("/appointmentSubmissions") 
	public String appointmentSubmissions(Model model) {
		model.addAttribute("pageTitle", "employee submissions");
		List<Appointment> appsubmissions = appointDAO.getAppointmentSubmissions();
		model.addAttribute("appsubmissions", appsubmissions);
		List<PublicService> ps = psDAO.getPublicServices();
		model.addAttribute("ps", ps);
		return "employee/appointment-submissions";
	}
	
	@RequestMapping("/appointments")
	public String appointments(Model model) {
		model.addAttribute("pageTitle", "employee appointments");
		List<Appointment> appointments = appointDAO.getAppointments();
		model.addAttribute("appointments", appointments);
		List<PublicService> ps = psDAO.getPublicServices();
		model.addAttribute("ps", ps);
		return "employee/appointments";
	}
	
	@GetMapping("/accept-appointment")
	public String acceptapp(@RequestParam("id") Integer id) {
		Appointment appointment = appointDAO.getAppointment(id);
		appointDAO.acceptAppointment(appointment);
		return "redirect:/employee/appointmentSubmissions";
	}
	
	@GetMapping("/reject-appointment")
	public String rejectsm(@RequestParam("id") Integer id) {
		appointDAO.deleteAppointment(id);
		return "redirect:/employee/appointmentSubmissions";
	}
	
	@GetMapping("/modify-appointment")
	public String editsv(Model model, @RequestParam(name="id") Integer id) {
		model.addAttribute("pageTitle", "modify appointment");
		Appointment appointment = appointDAO.getAppointment(id);
		model.addAttribute(appointment);
		return "employee/modify-appointment";
	}
	
	@PostMapping("/modifyAppointmentForm")
	public String modifyAppointmentForm(Model model, @RequestParam(name="meeting-time") String dt, @ModelAttribute("appointment") Appointment appoint) {
		model.addAttribute("pageTitle", "modify appointment");
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
		Date theDate=null;
		try {
			theDate = (Date)formatter.parse(dt);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(theDate);
		cal.add(Calendar.HOUR, -2);
		Date theDateCorrected = cal.getTime();
		appointDAO.updateAppointment(new Appointment(appoint.getId(),theDateCorrected,true));
		return "redirect:/employee/appointments";
	}
	
	@GetMapping("/delete-appointment")
	public String deleteapp(@RequestParam("id") Integer id) {
		appointDAO.deleteAppointment(id);
		return "redirect:/employee/appointments";
	}
}
