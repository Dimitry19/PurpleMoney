package cm.purplemoney.program.usr.action;


import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class ProgramAction extends ActionSupport implements Preparable{

	private static final long serialVersionUID = 1L;
	private MemberVO user;
	
	MemberBO memberBO;

	public void prepare() {	
	}
	
	public String execute() {
		return SUCCESS;
	}
	 
	public String login() {
		System.out.println(getUser());
		
		return SUCCESS;
	}
	 
	public String index() {
	return SUCCESS;
	}
	 
	public String delete() {

		return SUCCESS;
	}
	 
	public MemberVO getUser() {
		return user;
	}
		 
	public void setUser(MemberVO usr) {
		this.user = usr;
	}

	public MemberBO getMemberBO() {
		return memberBO;
	}

	public void setMemberBO(MemberBO memberBO) {
		this.memberBO = memberBO;
	}

}
