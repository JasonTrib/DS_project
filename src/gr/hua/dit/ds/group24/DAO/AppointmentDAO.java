package gr.hua.dit.ds.group24.DAO;

import java.util.List;

import gr.hua.dit.ds.group24.entity.Appointment;

public interface AppointmentDAO {
	public List<Appointment> getAppointments();
	public Appointment getAppointment(Integer id);
	public void saveAppointment(Appointment appoint);
	public void updateAppointment(Appointment appoint);
	public void deleteAppointment(Integer id);
	public List<Appointment> getCitizenAppointments(String name);
	public void deletePublicServiceAppointments(Integer id);
}
