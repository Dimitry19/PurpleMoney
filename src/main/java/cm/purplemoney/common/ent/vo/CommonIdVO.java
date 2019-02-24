package cm.purplemoney.common.ent.vo;

import cm.purplemoney.constants.FieldConstants;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;

public class CommonIdVO implements Serializable{
	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
		@Basic(optional = false)
		@Column(name="ID", nullable = false, length = FieldConstants.ID_STD_LEN)
		public String getId() {
			return id;
		}
		
		public void setId(String id) {
			this.id = id;
		}

}
