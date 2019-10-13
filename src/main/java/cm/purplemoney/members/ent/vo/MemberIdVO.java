package cm.purplemoney.members.ent.vo;


import cm.purplemoney.constants.FieldConstants;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class MemberIdVO implements Serializable{

	private String name;
	private String associationId;

	public MemberIdVO() {

	}
	public MemberIdVO(String name,String associationId) {
		this.associationId=associationId;
		this.name = name;
	}

	@Basic(optional = false)
	@Column(name="R_ASSOCIATION", nullable = false, length = FieldConstants.ID_STD_LEN)
	public String getAssociationId() {
		return associationId;
	}

	@Basic(optional = false)
	@Column(name="MNAME",nullable = false,length = FieldConstants.NAME_STD_LEN)
	public String getName() {
		return name;
	}


	public void setAssociationId(String associationId) {
		this.associationId = associationId;
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
		return associationId.equals(that.associationId);
	}

	@Override
	public int hashCode() {
		int result = name.hashCode();
		result = 31 * result + associationId.hashCode();
		return result;
	}



}
