package gr.hua.dit.ds.group24.DAO;

import java.util.List;

import gr.hua.dit.ds.group24.entity.User;

public interface UserDAO {
	public User getUserByUsername(String username);
	public List<User> getUsers();
	public List<User> getManagers();
	public List<User> getSupervisors();
	public List<User> getEmployees();
	public List<User> getEmployees(Integer psid);
	public void saveUser(User user);
	public void updateUser(User user);
	public void deleteUser(String username);
	public List<User> getSubmissions();
}
