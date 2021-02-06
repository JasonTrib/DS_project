package gr.hua.dit.ds.group24.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "appointment")
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date")
	private Date date;
	
	@Column(name = "validated")
	private boolean validated;
	
	@Column(name = "ps_id")
	private int psid;
	
	@Column(name = "citizen_name")
	private String citizenName;
	
	@Column(name = "citizen_email")
	private String citizenEmail;
	
	
	
	public Appointment() {
		super();
	}

	public Appointment(Date date, boolean validated, int psid) {
		super();
		this.date = date;
		this.validated = validated;
		this.psid = psid;
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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
	
	public String getCitizenName() {
		return citizenName;
	}

	public void setCitizenName(String citizenName) {
		this.citizenName = citizenName;
	}

	public String getCitizenEmail() {
		return citizenEmail;
	}

	public void setCitizenEmail(String citizenEmail) {
		this.citizenEmail = citizenEmail;
	}

	
	@Override
	public String toString() {
		return "Appointment [id=" + id + ", date=" + date + ", validated=" + validated + ", psid=" + psid
				+ ", citizenName=" + citizenName + ", citizenEmail=" + citizenEmail + "]";
	}
	
}