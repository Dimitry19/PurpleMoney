package cm.purplemoney.session.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.bo.CommonBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.session.ent.vo.*;
import cm.purplemoney.session.ent.wrapper.SessionSearchWr;

import java.util.List;

public interface SessionBO  extends CommonBO {//extends GenericBO<AmountVO,AmountIdVO,String>  {


     List<SessionVO> loadAllSession() throws BusinessException;
     SessionVO frequenceByMember(MemberVO member) throws BusinessException;
     boolean addSession(SessionVO amount) throws BusinessException;
     List<SessionVO> consultSession(SessionSearchWr asw ) throws BusinessException;

}
