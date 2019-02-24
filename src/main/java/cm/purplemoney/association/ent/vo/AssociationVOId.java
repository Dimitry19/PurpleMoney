/**
 * 
 */
package cm.purplemoney.association.ent.vo;


import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

import cm.purplemoney.constants.FieldConstants;


@Embeddable
public class AssociationVOId implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	

	public AssociationVOId() {
		
	}
	public AssociationVOId(String id, String name) {
		this.id = id;
		this.name = name;
	}
	
	@Basic(optional = false)
	@Column(name="ID",nullable = false,length =FieldConstants.ADDRESS_LEN)
	public String getId() {
		return id;
	}


	@Basic(optional = false)
	@Column(name="NAME",nullable = false)
	public String getName() {
		return name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		AssociationVOId that = (AssociationVOId) o;

		if (!name.equals(that.name)) return false;
		return id.equals(that.id);
	}

	@Override
	public int hashCode() {
		int result = id.hashCode();
		result = 31 * result + id.hashCode();
		return result;
	}
}
