package cm.purplemoney.members.ent.bo;


import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.members.ent.vo.MemberVO;

import java.util.List;

public interface MemberBO {
	
	public MemberVO findMember(String username, String assId) throws BusinessException;
	public MemberVO findMember(SessionVO session) throws BusinessException;
	public void addMember(MemberVO member) throws BusinessException;
	public List<MemberVO> loadAllMembers() throws BusinessException;
	public void saveEditMember(MemberVO member) throws BusinessException;

}
