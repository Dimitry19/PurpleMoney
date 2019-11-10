package cm.purplemoney.loan.ent.vo;

import cm.purplemoney.constants.FieldConstants;
import cm.purplemoney.members.ent.vo.MemberVO;
import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;

@Embeddable
public class LoanVOId implements Serializable {

	private BigInteger id;
	//private String association;
	private MemberVO member;

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
/*
	@Basic(optional = false)
	@Column(name="ID_ASSOCIATION", nullable = false,length = FieldConstants.ID_STD_LEN)
	public String getAssociation() {
		return association;
	}

	public void setAssociation(String association) {
		this.association = association;
	}
*/
	@ManyToOne
	@JoinColumns({
		@JoinColumn(name = "R_MEMBER",       referencedColumnName ="MNAME" ,        insertable=false, updatable=false),
		@JoinColumn(name = "ID_ASSOCIATION", referencedColumnName = "R_ASSOCIATION",insertable=false, updatable=false)
	})
	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}
}
