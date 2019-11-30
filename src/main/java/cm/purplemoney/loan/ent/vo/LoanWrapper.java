package cm.purplemoney.loan.ent.vo;


import cm.purplemoney.association.ent.vo.AssociationVO;

import java.io.Serializable;

public class LoanWrapper implements Serializable {

	private LoanVO loan;
	private AssociationVO association;

	public LoanVO getLoan() {
		return loan;
	}

	public void setLoan(LoanVO loan) {
		this.loan = loan;
	}

	public AssociationVO getAssociation() {
		return association;
	}

	public void setAssociation(AssociationVO association) {
		this.association = association;
	}
}
