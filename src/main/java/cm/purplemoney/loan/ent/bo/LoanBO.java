package cm.purplemoney.loan.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import org.springframework.stereotype.Component;

import java.util.List;


public interface LoanBO {

	List loans() throws BusinessException;

}
