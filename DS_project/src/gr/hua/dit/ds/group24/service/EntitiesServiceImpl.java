package gr.hua.dit.ds.group24.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.hua.dit.ds.group24.DAO.AuthoritiesDAO;
import gr.hua.dit.ds.group24.DAO.PublicServiceDAO;
import gr.hua.dit.ds.group24.DAO.UserDAO;
import gr.hua.dit.ds.group24.entity.Authorities;
import gr.hua.dit.ds.group24.entity.PublicService;
import gr.hua.dit.ds.group24.entity.User;

@Service
public class EntitiesServiceImpl implements EntitiesService {
	@Autowired
	private PublicServiceDAO psDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AuthoritiesDAO authDAO;
	
	@Transactional
	public void savePublicServiceUser(PublicService ps,User user) {
		psDAO.savePublicService(ps);
		userDAO.saveUser(user);
	}
	
	@Transactional
	public void saveUserAuthorities(User user, Authorities auth) {
		userDAO.saveUser(user);
		authDAO.saveAuthority(auth);
	}
	
	@Transactional
	public void acceptSubmission(PublicService ps, User user){
		ps.setValidated(true);
		psDAO.updatePublicService(ps);
		user.setTitle("Supervisor");
		Authorities auth = new Authorities("ROLE_SUPERVISOR",user);
		userDAO.updateUser(user);
		authDAO.saveAuthority(auth);
	}
}
