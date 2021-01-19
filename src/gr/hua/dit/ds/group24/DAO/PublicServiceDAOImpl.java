package gr.hua.dit.ds.group24.DAO;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import gr.hua.dit.ds.group24.entity.PublicService;

@Repository
public class PublicServiceDAOImpl implements PublicServiceDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<PublicService> getPublicServices() {
		Session session = sessionFactory.getCurrentSession();
		Query<PublicService> query = session.createQuery("from PublicService where validated=true", PublicService.class);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public PublicService getPublicService(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query<PublicService> query = session.createQuery("from PublicService where id='"+id+"' and validated=1", PublicService.class);
		return query.getResultList().get(0);
	}

	@Override
	@Transactional
	public void savePublicService(PublicService ps) {
		Session session = sessionFactory.getCurrentSession();
		session.save(ps);
	}

	@Override
	@Transactional
	public void updatePublicService(PublicService ps){
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update PublicService set name='"+ps.getName()+"',address='"+ps.getAddress()+"',appointment_room='"+ps.getAppointmentRoom()+"',validated='"+(ps.isValidated()?1:0)+"' where id='"+ps.getId()+"'").executeUpdate();
	}
	
	@Override
	@Transactional
	public void deletePublicService(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		PublicService ps = session.get(PublicService.class, id);
		session.delete(ps);
	}
	
	@Override
	@Transactional
	public void rejectSubmission(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		PublicService ps = session.get(PublicService.class, id);
		session.delete(ps);
	}

}
