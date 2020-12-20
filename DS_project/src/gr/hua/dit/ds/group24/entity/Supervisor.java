package gr.hua.dit.ds.group24.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "supervisor")
public class Supervisor {
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
	
	@Column(name = "validated")
	private boolean validated;
	
	@Column(name = "ps_id")
	private int psid;
	
	
	public Supervisor() {
		super();
	}
	
	public Supervisor(String fullName, String password, String role, boolean validated, int psid) {
		super();
		this.fullName = fullName;
		this.password = password;
		this.role = role;
		this.validated = validated;
		this.psid = psid;
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
	
	public boolean isValidated() {
		return validated;
	}

	public void setValidated(boolean validated) {
		this.validated = validated;
	}
	
	public int getPsid() {
		return psid;
	}

	public void setPsid(int psid) {
		this.psid = psid;
	}

	
	@Override
	public String toString() {
		return "Supervisor [id=" + id + ", fullName=" + fullName + ", password=" + password + ", role=" + role
				+ ", validated=" + validated + ", psid=" + psid + "]";
	}
	
}
