package cm.purplemoney.group.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.bo.CommonBO;
import cm.purplemoney.group.ent.vo.GroupVO;

import java.util.List;

public interface GroupBO extends CommonBO {//extends GenericBO<AmountVO,AmountIdVO,String>  {


    public List<GroupVO> loadAllGroups() throws BusinessException;
    public void addGroup(GroupVO group) throws BusinessException;

}
