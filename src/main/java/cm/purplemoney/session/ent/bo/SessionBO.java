package cm.purplemoney.session.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.session.ent.vo.*;
import cm.purplemoney.session.ent.wrapper.SessionSearchWr;

import java.util.List;

public interface SessionBO {//extends GenericBO<AmountVO,AmountIdVO,String>  {


     List<SessionVO> loadAllSession() throws BusinessException;
     void addSession(SessionVO amount) throws BusinessException;
     List<SessionVO> consultSession(SessionSearchWr asw ) throws BusinessException;

}
