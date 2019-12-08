package cm.purplemoney.loan.ent.vo;

import cm.purplemoney.constants.FieldConstants;
import cm.purplemoney.constants.FilterConstants;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.Formula;
import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "LOANS", schema = "PUBLIC")
@NamedQueries({
		@NamedQuery(name = LoanVO.ALL, query = "select l from LoanVO l   order by id.mmember.id.name"),
})
@Filters({
		@Filter(name = FilterConstants.ASSOCIATION),
		@Filter(name=FilterConstants.ACTIVE_MBR)
})
public class LoanVO implements Serializable {

	private LoanVOId id;
	private Date loanDate;
	private Date loanDateRemb;
	private boolean extended;
	private boolean balanced;
	private BigDecimal amount;
	private BigDecimal amountToBack;
	private BigDecimal tax;



	/*private String associationId;
	@Basic(optional = false)
	@Column(name="ID_ASSOCIATION", insertable=false, updatable=false)
	public String getAssociationId() {
		return associationId;
	}

	public void setAssociationId(String associationId) {
		this.associationId = associationId;
	}*/



	private BigDecimal totalAmount;


	public static final String ALL = "cm.purplemoney.loan.ent.vo.LoanVO.All";
	public static final String SUM_MONTH = "cm.purplemoney.loan.ent.vo.LoanVO.sum";

	@EmbeddedId
	public LoanVOId getId() {
		return id;
	}

	public void setId(LoanVOId id) {
		this.id = id;
	}

	@Basic(optional = false)
	@Column(name = "DATE_LOAN_START")
	@Temporal(TemporalType.DATE)
	public Date getLoanDate() {
		return loanDate;
	}

	public void setLoanDate(Date loanDate) {
		this.loanDate = loanDate;
	}

	@Basic(optional = false)
	@Column(name = "DATE_LOAN_REMB")
	@Temporal(TemporalType.DATE)
	public Date getLoanDateRemb() {
		return loanDateRemb;
	}

	public void setLoanDateRemb(Date loanDateRemb) {
		this.loanDateRemb = loanDateRemb;
	}

	@Basic(optional = false)
	@Column(name="EXTENDED")
	public boolean isExtended() {
		return extended;

	}

	public void setExtended(boolean extended) {
		this.extended = extended;
	}


	@Basic(optional = false)
	@Column(name="BALANCED")
	public boolean isBalanced() {
		return balanced;

	}


	public void setBalanced(boolean balanced) {
		this.balanced = balanced;
	}

	@Basic(optional = false)
	@Column(name="AMOUNT")
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Basic(optional = false)
	@Column(name="TAX", length = FieldConstants.NAME_STD_LEN)
	public BigDecimal getTax() {
		return tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}



	@Transient
	public BigDecimal getTotalAmount() {


		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}


	@Formula("AMOUNT*TAX/100+AMOUNT")
	public BigDecimal getAmountToBack() {
		return amountToBack;
	}

	public void setAmountToBack(BigDecimal amountToBack) {
		this.amountToBack = amountToBack;
	}
}
