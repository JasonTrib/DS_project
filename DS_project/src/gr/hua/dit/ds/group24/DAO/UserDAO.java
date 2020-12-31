package gr.hua.dit.ds.group24.DAO;

import java.util.List;

import gr.hua.dit.ds.group24.entity.User;

public interface UserDAO {
	
	public List<User> getUsers();
	public User getUserByUsername(String username);
	public List<User> getEmployees();
	public List<User> getEmployees(Integer psid);
	public User getEmployee(String username);
	public void saveUser(User user);
	public void deleteUser(String username);
	public void updateEmployee(User employee);
	
}
