package cm.purplemoney.association.usr.action;

import java.util.List;

import cm.purplemoney.common.usr.action.BaseAction;

import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
import com.opensymphony.xwork2.Preparable;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component("associationAction")
@Scope("prototype")
public class AssociationAction extends BaseAction implements SessionAware,Preparable {
	

	private static final long serialVersionUID = 1L;

	@Resource(name="associationBO")
    AssociationBO associationBO;

	
	AssociationVO association;
	
	List associations ;


	public void prepare() throws Exception {
		associations= associationBO.loadAllAssociations();
	}
	
	public String execute() {
		return SUCCESS;
	}
	public String add() throws Exception{
	

		associationBO.addAssociation(association);
		associations = null;
		associations= associationBO.loadAllAssociations();
		
		return SUCCESS;
	
	}

	public String all() throws Exception{
		associations= associationBO.loadAllAssociations();
		return SUCCESS;	
	}

	
	public AssociationVO getAssociation() {
		return association;
	}

	public void setAssociation(AssociationVO association) {
		this.association = association;
	}

	public List<AssociationVO> getAssociations() {
		return associations;
	}

	public void setAssociations(List<AssociationVO> associations) {
		this.associations = associations;
	}
	


}
