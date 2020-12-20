package gr.hua.dit.ds.group24.DAO;

import javax.transaction.Transactional;

public interface EmployeeDAO {

	public void createEmployee();
	public void deleteEmployee();
	public void updateEmployee();
	public void getEmployees();
}
