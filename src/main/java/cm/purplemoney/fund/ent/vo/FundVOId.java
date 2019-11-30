package cm.purplemoney.fund.ent.vo;


import cm.purplemoney.members.ent.vo.MemberVO;
import org.hibernate.mapping.ToOne;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;

@Embeddable
public class FundVOId implements Serializable {

	private BigInteger id;

	private MemberVO mmember;

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


	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumns({
			@JoinColumn(name = "ID_ASSOCIATION", referencedColumnName = "R_ASSOCIATION", insertable = false,updatable = false),
			@JoinColumn(name = "R_MEMBER", referencedColumnName ="MNAME",insertable = false,updatable = false)
	})
	public MemberVO getMmember() {
		return mmember;
	}

	public void setMmember(MemberVO mmember) {
		this.mmember = mmember;
	}
}
