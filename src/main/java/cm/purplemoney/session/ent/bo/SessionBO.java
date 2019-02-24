package cm.purplemoney.session.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.session.ent.vo.*;
import cm.purplemoney.session.ent.wrapper.AmountSearchWr;

import java.util.List;

public interface SessionBO {//extends GenericBO<AmountVO,AmountIdVO,String>  {


    public List<SessionVO> loadAllAmount() throws BusinessException;
    public void addAmount(SessionVO amount) throws BusinessException;
    public List<SessionVO> searcheAmount(AmountSearchWr asw ) throws BusinessException;

}
