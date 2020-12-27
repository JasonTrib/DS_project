package gr.hua.dit.ds.group24.DAO;

import gr.hua.dit.ds.group24.entity.User;

public interface UserDetailsDao {
	  User findUserByUsername(String username);
	}
