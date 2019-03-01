/**
 * 
 */
package cm.purplemoney.association.ent.vo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import cm.purplemoney.constants.FieldConstants;

import java.math.BigInteger;
import java.util.Date;

@Entity
@Table(name="ASSOCIATION" , schema="PUBLIC")
public class AssociationVO implements Serializable{
	private static final long serialVersionUID = -1883317581153939034L;
	 

	private AssociationVOId id;
	private String description;
	private BigInteger amount;
	
	//public static final String Q_AC_ITEM = "it.fracm.dal.article.ent.vo.ArticleVO.QAutocompleteItem";
	public AssociationVO() {
		
	}

	
	@EmbeddedId
	public AssociationVOId getId(){	return id;	}
	
	public void setId(AssociationVOId id) {
		this.id=id;
	}
	

	
	@Basic(optional = false)
	@Column(name="DESCRIPTION",length = FieldConstants.DESC_EXT_LEN)
	public String getDescription() {
		return description;
	}
	public void setDescription( String desc) {
		this.description=desc;
	}
	

	
	@Basic(optional = false)
	@Column(name="R_AMOUNT", nullable=false)
	public BigInteger getAmount() {
		return amount;
	}
	public void setAmount(BigInteger amount) {
		this.amount = amount;
	}
	

	

	
}
