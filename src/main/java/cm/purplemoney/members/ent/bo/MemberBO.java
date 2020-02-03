package cm.purplemoney.members.ent.bo;


import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.bo.CommonBO;
import cm.purplemoney.common.ent.vo.WidgetVO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.members.ent.vo.MemberVO;
import java.util.List;

public interface MemberBO extends CommonBO {

	 List<MemberVO>  findMember(String username, String assId) throws BusinessException;
	 MemberVO  findMemberInfo(String username, String assId) throws BusinessException;
	 MemberVO findMemberFromSession(SessionVO session) throws BusinessException;
	 void addMember(MemberVO member) throws BusinessException;
	 List<MemberVO> loadAllMembers(String association) throws BusinessException;
	 void saveEditMember(MemberVO member) throws BusinessException;
	 WidgetVO widgetInfo(String username, String association) throws BusinessException;
	 List<MemberVO> autocomplete(String search,String association) throws BusinessException;

}
