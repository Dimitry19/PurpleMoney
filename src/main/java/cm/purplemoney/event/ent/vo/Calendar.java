package cm.purplemoney.event.ent.vo;

import cm.purplemoney.constants.FieldConstants;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name = "EVENTS", schema = "PUBLIC")
@NamedQueries({
		@NamedQuery(name = Calendar.ALL, query = "select e from Calendar e where association =:assId order by id"),
})
public class Calendar {


	public static final String ALL = "cm.purplemoney.event.ent.vo.Calendar.All";
	private String id;
	private String association;
	private Date date;
	private String member;
	private String type;


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID", nullable = false)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Basic(optional = false)
	@Column(name="R_ASSOCIATION", nullable = false,length = FieldConstants.ID_STD_LEN)
	public String getAssociation() {
		return association;
	}

	public void setAssociation(String association) {
		this.association = association;
	}

	@Basic(optional = false)
	@Column(name = "DATE")
	@Temporal(TemporalType.DATE)
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Basic(optional = false)
	@Column(name="R_MEMBER", length = FieldConstants.NAME_STD_LEN)
	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	@Basic(optional = false)
	@Column(name = "R_EVENT_TYPE",length =8)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
