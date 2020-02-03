package cm.purplemoney.fund.ent.vo;


import cm.purplemoney.members.ent.vo.MemberVO;
import org.hibernate.mapping.ToOne;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;

@Embeddable
public class FundVOId implements Serializable {

	private BigInteger id;
	private String mmember;
	private String associationId;

	public FundVOId() {
	}
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID", nullable = false)
	public BigInteger getId() {
		return id;
	}

	public void setId(BigInteger id) {
		this.id = id;
	}


/*	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumns({
			@JoinColumn(name = "ID_ASSOCIATION", referencedColumnName = "R_ASSOCIATION", insertable = false,updatable = false),
			@JoinColumn(name = "R_MEMBER", referencedColumnName ="MNAME",insertable = false,updatable = false)
	})
	public MemberVO getMmember() {
		return mmember;
	}

	public void setMmember(MemberVO mmember) {
		this.mmember = mmember;
	}*/

	@Basic(optional = false)
	@Column(name = "R_MEMBER")
	public String getMmember() {
		return mmember;
	}

	public void setMmember(String mmember) {
		this.mmember = mmember;
	}

	@Basic(optional = false)
	@Column(name = "ID_ASSOCIATION")
	public String getAssociationId() {
		return associationId;
	}

	public void setAssociationId(String associationId) {
		this.associationId = associationId;
	}
}
