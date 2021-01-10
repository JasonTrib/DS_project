package gr.hua.dit.ds.group24.DAO;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.ds.group24.entity.User;

@Repository
public class UserDetailsDaoImp implements UserDetailsDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User findUserByUsername(String username) {
		return sessionFactory.getCurrentSession().get(User.class, username);
	}

}
