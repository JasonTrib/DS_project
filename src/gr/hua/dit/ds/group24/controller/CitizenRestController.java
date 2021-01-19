package gr.hua.dit.ds.group24.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import gr.hua.dit.ds.group24.DateUtils;
import gr.hua.dit.ds.group24.DAO.AppointmentDAO;
import gr.hua.dit.ds.group24.DAO.PublicServiceDAO;
import gr.hua.dit.ds.group24.entity.Appointment;
import gr.hua.dit.ds.group24.entity.PublicService;

@RestController
@RequestMapping("/api")
public class CitizenRestController {
	@Autowired
	private AppointmentDAO appointDAO;
	
	@Autowired
	private PublicServiceDAO psDAO;

	@GetMapping("/public_services")
	public List<PublicService> publicServices() {
		return psDAO.getPublicServices();
	}

	@GetMapping("/public_services/{psId}")
	public PublicService publicService(@PathVariable int psId) {
		PublicService publicService = psDAO.getPublicService(psId);
		if (publicService == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "public service not found");
		}
		return publicService;
	}
	
	@GetMapping("/appointments")
	public List<Appointment> appointments() {
		//return appointDAO.getAppointments();
		List<Appointment> appoints = appointDAO.getAppointments();
		for (Appointment var : appoints) { 
			System.out.println(DateUtils.formatDate(var.getDate()));
		}
		return appoints;
	}

	@GetMapping("/appointments/{appointId}")
	public Appointment appointment(@PathVariable int appointId) {
		Appointment appointment = appointDAO.getAppointment(appointId);
		if (appointment == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "appointment not found");
		}
		return appointment;
	}
	
	@PostMapping("/appointments")
	public Appointment addAppointment(@RequestBody Appointment theAppointment) {
		/*
		 * also just in case the pass an id in JSON ... set id to 0 this is force a save
		 * of new item ... instead of update sample data (raw-application/json) {
		 * "firstName": "Alekos", "lastName": "Sakellarios", "email": "alekos@hua.gr" }
		 */
		theAppointment.setId(0);
		appointDAO.saveAppointment(theAppointment);
		return theAppointment;
	}
	
	@PutMapping("/appointments")
	public Appointment updateCustomer(@RequestBody Appointment theAppointment) {
		/*
		 * sample data (raw-application/json) { "id": "7", "firstName": "Alekos-New",
		 * "lastName": "Sakellarios", "email": "alekos@hua.gr" }
		 */
		appointDAO.updateAppointment(theAppointment);
		return theAppointment;
	}
	
	@DeleteMapping("/appointments/{appointId}")
	public String deleteCustomer(@PathVariable int appointId) {
		Appointment theAppointment = appointDAO.getAppointment(appointId);
		if (theAppointment == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "appointment not found");
		}
		appointDAO.deleteAppointment(appointId);
		return "Deleted appointment id - " + appointId;
	}
	
}