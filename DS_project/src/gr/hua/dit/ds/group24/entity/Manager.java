package gr.hua.dit.ds.group24.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "manager")
public class Manager {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "full_name")
	private String fullName;

	@Column(name = "password")
	private String password;
	
	@Column(name = "role")
	private String role;
	
	
	public Manager() {
		super();
	}

	public Manager(String fullName, String password, String role) {
		super();
		this.fullName = fullName;
		this.password = password;
		this.role = role;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}


	@Override
	public String toString() {
		return "Manager [id=" + id + ", fullName=" + fullName + ", password=" + password + ", role=" + role + "]";
	}
	
	
}
