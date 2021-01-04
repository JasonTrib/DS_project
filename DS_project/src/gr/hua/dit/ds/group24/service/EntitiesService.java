package gr.hua.dit.ds.group24.service;

import gr.hua.dit.ds.group24.entity.Authorities;
import gr.hua.dit.ds.group24.entity.PublicService;
import gr.hua.dit.ds.group24.entity.User;

public interface EntitiesService {
	public void savePublicServiceUser(PublicService ps, User user);
	public void saveUserAuthorities(User user, Authorities auth);
	public void acceptSubmission(PublicService ps, User user);
}
