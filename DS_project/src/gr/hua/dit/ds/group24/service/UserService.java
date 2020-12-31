package gr.hua.dit.ds.group24.service;

import gr.hua.dit.ds.group24.entity.Authorities;
import gr.hua.dit.ds.group24.entity.User;

public interface UserService {
	
	public void saveUserAuthorities(User user, Authorities auth);
	
}
