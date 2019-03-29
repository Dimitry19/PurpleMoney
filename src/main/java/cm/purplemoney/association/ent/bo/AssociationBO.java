package cm.purplemoney.association.ent.bo;
import java.util.List;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.members.ent.vo.MemberVO;


public interface AssociationBO {
	
	 void addAssociation(AssociationVO association) throws BusinessException;
	 List<AssociationVO> loadAllAssociations() throws  BusinessException;
	 AssociationVO associationInfoFromMember(MemberVO member) throws BusinessException;


}
