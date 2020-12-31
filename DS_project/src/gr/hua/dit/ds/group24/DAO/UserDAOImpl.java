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
	public List<User> getUsers() {
		// get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();
        // create a query
        Query<User> query = currentSession.createQuery("from User", User.class);
        // execute the query and get the results list
        List<User> users = query.getResultList();
        
        return users;
	}
	
	@Override
	@Transactional
	public User getUserByUsername(String username) {
		return sessionFactory.getCurrentSession().get(User.class, username);
	}
	
	@Override
	@Transactional
	public List<User> getEmployees() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> query = currentSession.createQuery("from User where title='Employee'", User.class);
        List<User> employees = query.getResultList();
        
        return employees;
	}
	
	@Override
	@Transactional
	public List<User> getEmployees(Integer psid){
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> query = currentSession.createQuery("from User where title='Employee'and ps_id='"+psid+"'", User.class);
        List<User> employees = query.getResultList();
        
        return employees;
	}
	
	@Override
	@Transactional
	public User getEmployee(String username) {
		Session currentSession = sessionFactory.getCurrentSession();
        Query<User> query = currentSession.createQuery("from User where username='"+username+"'", User.class);
        User employee = query.getResultList().get(0);
        
		return employee;
	}
	
	@Override
//	@Transactional
	public void saveUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
	}
	
	@Override
	@Transactional
	public void updateEmployee(User e) {
		Session session = sessionFactory.getCurrentSession();
		session.createQuery("update User set password='"+e.getPassword()+"',fullname='"+e.getFullname()+"',email='"+e.getEmail()+"'  where username='"+e.getUsername()+"'").executeUpdate();
	}
	
	@Override
	@Transactional
	public void deleteUser(String username) {
		Session session = sessionFactory.getCurrentSession();
		User user = session.get(User.class, username);
		session.delete(user);
	}

}
