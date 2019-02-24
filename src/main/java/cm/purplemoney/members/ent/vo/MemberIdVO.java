package cm.purplemoney.members.ent.vo;


import cm.purplemoney.constants.FieldConstants;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class MemberIdVO implements Serializable{

	private String name;
	private String memberId;

	public MemberIdVO() {

	}
	public MemberIdVO(String name,String memberId) {
		this.memberId=memberId;
		this.name = name;
	}

	@Basic(optional = false)
	@Column(name="ID", nullable = false, length = FieldConstants.ID_STD_LEN)
	public String getMemberId() {
		return memberId;
	}

	@Basic(optional = false)
	@Column(name="MNAME",nullable = false,length = FieldConstants.NAME_STD_LEN)
	public String getName() {
		return name;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		MemberIdVO that = (MemberIdVO) o;

		if (!name.equals(that.name)) return false;
		return memberId.equals(that.memberId);
	}

	@Override
	public int hashCode() {
		int result = name.hashCode();
		result = 31 * result + memberId.hashCode();
		return result;
	}



}
