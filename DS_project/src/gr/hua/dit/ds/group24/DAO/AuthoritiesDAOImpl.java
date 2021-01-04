package gr.hua.dit.ds.group24.DAO;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.ds.group24.entity.Authorities;

@Repository
public class AuthoritiesDAOImpl implements AuthoritiesDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public void saveAuthority(Authorities auth) {
		Session session = sessionFactory.getCurrentSession();
		session.save(auth);
	}
	
}
