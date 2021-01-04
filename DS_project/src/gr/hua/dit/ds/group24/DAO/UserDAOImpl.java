package gr.hua.dit.ds.group24.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.ds.group24.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public User getUserByUsername(String username) {
		return sessionFactory.getCurrentSession().get(User.class, username);
	}
	
	@Override
	@Transactional
	public List<User> getUsers() {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("from User", User.class);
        return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<User> getManagers() {
		Session session = sessionFactory.getCurrentSession();
		Query<User> query = session.createQuery("from User where title='Manager'", User.class);
		return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<User> getSupervisors() {
		Session session = sessionFactory.getCurrentSession();
		Query<User> query = session.createQuery("from User where title='Supervisor'", User.class);	
		return query.getResultList();		
	}
	
	@Override
	@Transactional
	public List<User> getEmployees() {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("from User where title='Employee'", User.class);
        return query.getResultList();
	}
	
	@Override
	@Transactional
	public List<User> getEmployees(Integer psid){
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("from User where title='Employee'and ps_id='"+psid+"'", User.class);
        return query.getResultList();
	}
	
	@Override
	@Transactional
	public void saveUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
	}
	
	@Override
	@Transactional
	public void updateUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update User set password='"+user.getPassword()+"',fullname='"+user.getFullname()+"',title='"+user.getTitle()+"',email='"+user.getEmail()+"'  where username='"+user.getUsername()+"'").executeUpdate();
	}
	
	@Override
	@Transactional
	public void deleteUser(String username) {
		Session session = sessionFactory.getCurrentSession();
		User user = session.get(User.class, username);
		session.delete(user);
	}
	
	@Override
	@Transactional
	public List<User> getSubmissions() {
		Session session = sessionFactory.getCurrentSession();
		Query<User> query = session.createQuery("from User where title='User' and ps.validated=0", User.class);
		return query.getResultList();
	}
	
}
