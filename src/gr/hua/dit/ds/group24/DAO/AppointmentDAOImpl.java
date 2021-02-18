package gr.hua.dit.ds.group24.DAO;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.ds.group24.entity.Appointment;

@Repository
public class AppointmentDAOImpl implements AppointmentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Appointment> getAppointments() {
		Session session = sessionFactory.getCurrentSession();
		Query<Appointment> query = session.createQuery("from Appointment where validated=true", Appointment.class);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public Appointment getAppointment(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query<Appointment> query = session.createQuery("from Appointment where id='"+id+"'", Appointment.class);
		return query.getResultList().get(0);
	}
	
	@Override
	@Transactional
	public void saveAppointment(Appointment appoint) {
		Session session = sessionFactory.getCurrentSession();
		session.save(appoint);
	}
	
	@Override
	@Transactional
	public void updateAppointment(Appointment appoint) {
		String date = (new SimpleDateFormat("yyyy-MM-dd HH:mm")).format(appoint.getDate());
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update Appointment set date='"+date+"', validated='"+(appoint.isValidated()?1:0)+"' where id='"+appoint.getId()+"'").executeUpdate();
	}
	
	@Override
	@Transactional
	public void deleteAppointment(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Appointment appointment = session.get(Appointment.class, id);
		session.delete(appointment);
	}
	
	@Override
	@Transactional
	public List<Appointment> getCitizenAppointments(String name) {
		Session session = sessionFactory.getCurrentSession();
		Query<Appointment> query = session.createQuery("from Appointment "+"where citizen_name='"+name+"'", Appointment.class);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public void deletePublicServiceAppointments(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("delete from Appointment where ps_id='"+id+"'").executeUpdate();
	}
	
	@Override
	@Transactional
	public List<Appointment> getAppointmentSubmissions() {
		Session session = sessionFactory.getCurrentSession();
		Query<Appointment> query = session.createQuery("from Appointment where validated=false", Appointment.class);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public void acceptAppointment(Appointment appoint) {
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update Appointment set validated=true where id='"+appoint.getId()+"'").executeUpdate();
	}
}
