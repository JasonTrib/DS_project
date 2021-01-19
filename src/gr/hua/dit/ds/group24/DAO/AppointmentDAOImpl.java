package gr.hua.dit.ds.group24.DAO;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.ds.group24.DateUtils;
import gr.hua.dit.ds.group24.entity.Appointment;
import gr.hua.dit.ds.group24.entity.PublicService;
import gr.hua.dit.ds.group24.entity.User;

@Repository
public class AppointmentDAOImpl implements AppointmentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Appointment> getAppointments() {
		Session session = sessionFactory.getCurrentSession();
		Query<Appointment> query = session.createQuery("from Appointment", Appointment.class);
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
		
		String a = DateUtils.formatDate(appoint.getDate());
		
//		System.out.println(">>>>>"+appoint.getDate()+" <<>> "+a);///////////////////////////////////////////////////////////////////////////////////

		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update Appointment set date='"+a+"' where id='"+appoint.getId()+"'").executeUpdate();
	}
	
	@Override
	@Transactional
	public void deleteAppointment(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Appointment appointment = session.get(Appointment.class, id);
		session.delete(appointment);
	}
}
