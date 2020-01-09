package cm.purplemoney.fund.ent.vo;

import cm.purplemoney.constants.FilterConstants;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.Filters;
import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "FUND", schema = "PUBLIC")
	@NamedQueries(
			{
			@NamedQuery(name = FundVO.ALL, query = "select f from FundVO f   order by id.mmember.id.name"),
			@NamedQuery(name = FundVO.ByMBR_ID, query = "select f from FundVO f   where id.mmember.id.name=:id and id.mmember.id.associationId=:assId  order by id.mmember.id.name"),
})
@Filters({@Filter(name = FilterConstants.ASSOCIATION), @Filter(name = FilterConstants.ACTIVE_MBR)})
public class FundVO implements Serializable {

	private FundVOId id;
	private Date date;
	private BigDecimal amount;
	private BigDecimal totalByMember;
	private BigDecimal globalTotal;
	//private String associationId;


	public static final String ALL = "cm.purplemoney.fund.ent.vo.FundVO.All";
	public static final String ByMBR_ID = "cm.purplemoney.fund.ent.vo.FundVO.byId";

	@EmbeddedId
	public FundVOId getId() {
		return id;
	}

	public void setId(FundVOId id) {
		this.id = id;
	}

	@Basic(optional = false)
	@Column(name = "DATE_FUND_START")
	@Temporal(TemporalType.DATE)
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}


	@Basic(optional = false)
	@Column(name = "AMOUNT")
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Transient
	public BigDecimal getTotalByMember() {
		return totalByMember;
	}

	public void setTotalByMember(BigDecimal totalByMember) {
		this.totalByMember = totalByMember;
	}

	@Transient
	public BigDecimal getGlobalTotal() {
		return globalTotal;
	}

	public void setGlobalTotal(BigDecimal globalTotal) {
		this.globalTotal = globalTotal;
	}
	/*
	@Basic(optional = false)
	@Column(name = "ID_ASSOCIATION", length = FieldConstants.ID_STD_LEN)
	public String getAssociationId() {
		return associationId;
	}

	public void setAssociationId(String associationId) {
		this.associationId = associationId;
	}*/

}
