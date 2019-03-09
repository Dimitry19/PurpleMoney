package cm.purplemoney.members.ent.bo;


import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.members.ent.vo.MemberVO;

import java.util.List;

public interface MemberBO {
	
	 MemberVO findMember(String username, String assId) throws BusinessException;
	 MemberVO findMember(SessionVO session) throws BusinessException;
	 void addMember(MemberVO member) throws BusinessException;
	 List<MemberVO> loadAllMembers() throws BusinessException;
	 void saveEditMember(MemberVO member) throws BusinessException;
	String[] autocomplete(String search) throws BusinessException;

}
