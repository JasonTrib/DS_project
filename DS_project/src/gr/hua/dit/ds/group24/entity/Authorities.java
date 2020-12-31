package gr.hua.dit.ds.group24.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "authorities")
public class Authorities {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private String id;
	
	@Column(name = "authority")
	private String authority;

	@ManyToOne(targetEntity = User.class)
	@JoinColumn(name = "username", referencedColumnName = "username", nullable = false)
	private User user;

	

	
	
	public Authorities() {
		super();
	}
	
	

	public Authorities(String authority) {
		super();
		this.authority = authority;
	}



	public Authorities(String authority, User user) {
		super();
		this.authority = authority;
		this.user = user;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Authorities [authority=" + authority + ", user=" + user + "]";
	}


	

}
