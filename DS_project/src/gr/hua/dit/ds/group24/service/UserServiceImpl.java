package gr.hua.dit.ds.group24.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.hua.dit.ds.group24.DAO.AuthoritiesDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.entity.Authorities;
import gr.hua.dit.ds.group24.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	public UserDAO userDAO;
	
	@Autowired
	public AuthoritiesDAO authDAO;
	
	@Transactional
	public void saveUserAuthorities(User user, Authorities auth) {
		userDAO.saveUser(user);
		authDAO.saveAuthority(auth);
	}
	

}
