package cm.purplemoney.sanction.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.bo.CommonBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.sanction.ent.vo.SanctionVO;
import java.util.List;

public interface SanctionBO extends CommonBO {
    void addSanction(SanctionVO sanction) throws BusinessException;
    List<SanctionVO> allSanctions(String association) throws BusinessException;
    SanctionVO findSanctionByUser(MemberVO member) throws BusinessException;
    String[] autocomplete(String search,String association) throws BusinessException;

}
