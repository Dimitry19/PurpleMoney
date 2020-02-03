package cm.purplemoney.loan.ent.vo;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;

@Embeddable
public class LoanVOId implements Serializable {

	private BigInteger id;
	private String associationId;
	private String mmember;


	public LoanVOId() {
	}
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID", nullable = false)
	public BigInteger getId() {
		return id;
	}

	public void setId(BigInteger id) {
		this.id = id;
	}

	@Basic(optional = false)
	@Column(name = "ID_ASSOCIATION")
	public String getAssociationId() {
		return associationId;
	}

	public void setAssociationId(String associationId) {
		this.associationId = associationId;
	}
	@Basic(optional = false)
	@Column(name = "R_MEMBER")
	public String getMmember() {
		return mmember;
	}

	public void setMmember(String mmember) {
		this.mmember = mmember;
	}


}
