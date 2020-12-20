package gr.hua.dit.ds.group24.DAO;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gr.hua.dit.ds.group24.entity.Employee;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void createEmployee() {
		Session session = sessionFactory.getCurrentSession();
		// create an employee
		Employee employee = new Employee("John Smith", "pass123","ROLE_EMPLOYEE",1);
		// save the employee
		session.save(employee);
		
		System.out.println("Created employee:\n" + employee.toString());
	}
	
	@Override
	@Transactional
	public void deleteEmployee() {
		
	}
	
	@Override
	@Transactional
	public void updateEmployee() {
		
	}
	
	@Override
	@Transactional
	public void getEmployees() {
		
	}
}
