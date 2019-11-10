package cm.purplemoney.sanction.ent.vo;


import cm.purplemoney.constants.FilterConstants;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.Filters;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name ="DECODE_SANCTION", schema = "PUBLIC")

public class DecodeSanctionVO implements Serializable {

	private String id;
	private String description;
	private BigDecimal tax;

	public DecodeSanctionVO() {
	}

	@Id
	@Basic(optional = false)
	@Column(name = "ID_SANCTION", nullable = false)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Basic(optional = false)
	@Column(name = "DESCRIPTION", nullable = false)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Basic(optional = false)
	@Column(name = "TAUX", nullable = false)
	public BigDecimal getTax() {
		return tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}
}
