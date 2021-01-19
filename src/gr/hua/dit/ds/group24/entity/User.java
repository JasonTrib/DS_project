package gr.hua.dit.ds.group24.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "user")
public class User {
	@Id
	@Column(name = "username")
	private String username;

	@Column(name = "password", nullable = false)
	private String password;

	@Column(name = "enabled", nullable = false)
	private boolean enabled;

	@Column(name = "fullname")
	private String fullname;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "email")
	private String email;
	
	@ManyToOne(fetch = FetchType.EAGER, cascade= {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name = "ps_id")
	private PublicService ps;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL )
	private Set<Authorities> authorities = new HashSet<>();
	
	
	
	public User() {
		super();
	}

	public User(String username, String password, String fullname, String email) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
	}

	public User(String username, String password, boolean enabled, String fullname, String title, String email,
			PublicService ps) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.fullname = fullname;
		this.title = title;
		this.email = email;
		this.ps = ps;
	}
	
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public PublicService getPs() {
		return ps;
	}

	public void setPs(PublicService ps) {
		this.ps = ps;
	}

	public Set<Authorities> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<Authorities> authorities) {
		this.authorities = authorities;
	}
	
	
	
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", enabled=" + enabled + ", fullname="
				+ fullname + ", title=" + title + ", email=" + email + ", ps=" + ps + ", authorities=" + authorities
				+ "]";
	}
	
}