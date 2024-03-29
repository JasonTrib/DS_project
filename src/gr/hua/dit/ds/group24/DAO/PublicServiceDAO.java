package gr.hua.dit.ds.group24.DAO;

import java.util.List;

import gr.hua.dit.ds.group24.entity.PublicService;

public interface PublicServiceDAO {
	public List<PublicService> getPublicServices();
	public PublicService getPublicService(Integer id);
	public void savePublicService(PublicService ps);
	public void validatePublicService(PublicService ps);
	public void deletePublicService(Integer Id);
	public void rejectSubmission(Integer id);
	public void updatePublicService(PublicService ps);
}
