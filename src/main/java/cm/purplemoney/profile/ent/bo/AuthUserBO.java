package cm.purplemoney.profile.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.profile.ent.vo.AuthUserVO;

public interface AuthUserBO {
	
	public AuthUserVO login(String username, String password) throws BusinessException;
	public void saveEditUser(String username,String password,MemberVO memeberInfo) throws BusinessException;
	public AuthUserVO findByMember(String memeberUserInfo) throws BusinessException;

}
