package cm.purplemoney.role.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.role.ent.vo.RoleVO;

import java.util.List;

public interface RoleBO {//extends GenericBO<AmountVO,AmountIdVO,String>  {


    public List<RoleVO> loadAllRoles() throws BusinessException;
    public void addRole(RoleVO role) throws BusinessException;
    public int  updateRoleByMember(String roleId) throws BusinessException;
    public RoleVO retrieveRoleFromMember(MemberVO member) throws BusinessException;

}

