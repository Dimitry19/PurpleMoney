package cm.purplemoney.fund.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.fund.ent.vo.FundVO;
import cm.purplemoney.loan.ent.vo.LoanVO;
import cm.purplemoney.loan.ent.vo.LoanWrapper;
import cm.purplemoney.members.ent.vo.MemberIdVO;
import org.springframework.stereotype.Component;

import java.util.List;


public interface FundBO {

	List funds() throws BusinessException;
	boolean addFund(FundVO fund) throws BusinessException;

	FundVO findByMember(MemberIdVO mbrId)throws BusinessException;;
}
