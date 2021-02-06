package gr.hua.dit.ds.group24.DAO;

import java.util.List;

import gr.hua.dit.ds.group24.entity.Appointment;

public interface AppointmentDAO {
	public List<Appointment> getRequests(Integer psid);
}
