package gr.hua.dit.ds.group24.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.ds.group24.entity.Appointment;
import gr.hua.dit.ds.group24.entity.User;

@Repository
public class AppointmentDAOImpl implements AppointmentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Appointment> getRequests(Integer psid) {
        Session session = sessionFactory.getCurrentSession();
        
        Query<Appointment> query = session.createQuery("from Appointment where validated=0 and ps_id='"+psid+"'", Appointment.class);
        
        return query.getResultList();
	}
}
