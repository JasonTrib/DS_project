package gr.hua.dit.ds.group24.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "public_service")
public class PublicService {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "address")
	private String address;

	@Column(name = "appointment_room")
	private String appointmentRoom;

	@Column(name = "validated")
	private boolean validated;

	@OneToMany(mappedBy = "ps", cascade = CascadeType.ALL)
	private List<User> users;
	
	
	
	public PublicService() {
		super();
	}

	public PublicService(String name, String address, String appointmentRoom, boolean validated) {
		super();
		this.name = name;
		this.address = address;
		this.appointmentRoom = appointmentRoom;
		this.validated = validated;
	}
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAppointmentRoom() {
		return appointmentRoom;
	}

	public void setAppointmentRoom(String appointmentRoom) {
		this.appointmentRoom = appointmentRoom;
	}

	public boolean isValidated() {
		return validated;
	}

	public void setValidated(boolean validated) {
		this.validated = validated;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	
	
	@Override
	public String toString() {
		return "PublicService [id=" + id + ", name=" + name + ", address=" + address + ", appointmentRoom="
				+ appointmentRoom + ", validated=" + validated + ", users=" + users + "]";
	}
	
}