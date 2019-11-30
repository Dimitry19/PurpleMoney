package cm.purplemoney.loan.wrapper;

import java.math.BigDecimal;
import java.util.Date;

public class Loan {

	private Date loanDateBack;
	private BigDecimal amount;

	public Date getLoanDateBack() {
		return loanDateBack;
	}

	public void setLoanDateBack(Date loanDateBack) {
		this.loanDateBack = loanDateBack;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
}
