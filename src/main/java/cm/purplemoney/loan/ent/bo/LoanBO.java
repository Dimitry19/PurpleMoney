package cm.purplemoney.loan.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.bo.CommonBO;
import cm.purplemoney.loan.ent.vo.LoanVO;
import cm.purplemoney.loan.ent.vo.LoanWrapper;
import org.springframework.stereotype.Component;

import java.util.List;


public interface LoanBO extends CommonBO {

	List loans() throws BusinessException;
	boolean addLoan(LoanWrapper loanWrapper) throws BusinessException;
	boolean addLoan(LoanVO loan, String language) throws BusinessException;

}
