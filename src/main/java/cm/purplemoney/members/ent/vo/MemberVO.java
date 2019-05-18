package cm.purplemoney.members.ent.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import cm.purplemoney.constants.FieldConstants;
import cm.purplemoney.event.ent.vo.EventVO;
import cm.purplemoney.sanction.ent.vo.SanctionVO;
import cm.purplemoney.session.ent.vo.SessionVO;


import javax.persistence.*;


@Entity
@Table(name="MEMBER" , schema="PUBLIC")
@NamedQueries({
		@NamedQuery(name = MemberVO.Q_AC_ITEM, query = "select m from MemberVO m where (upper(id.name) like :searchFilter) or(upper(surname) like :" +
				"searchFilter ) or(id.name like :searchFilter) or( surname like :searchFilter)  and association=:ass order by id.name"),
		@NamedQuery(name = MemberVO.ALL, query = "select m from MemberVO m  where association=:ass order by id.name"),
		@NamedQuery(name = MemberVO.FINDBYID, query = "select m from MemberVO m where id.name =:uName and association=:ass and active=:act "),
		@NamedQuery(name = MemberVO.FINDBYSESSION, query = "select m from MemberVO m where id.name =:uName and association=:ass order by id.name"),
})
public class MemberVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7113228696088349695L;

	private MemberIdVO id;
	private String surname;
	private String phone;
	private String email;
	private String role;
	private boolean active;
	private boolean admin;
	private String address;
	private String roleDesc;
	private String sex;
	private  String association;
    private  String associationDesc;
	private String sexDesc;
	private boolean male;
	private Set<SanctionVO> sanctions= new HashSet<SanctionVO>();
	private Set<SessionVO> sessions= new HashSet<SessionVO>();
	private EventVO event;

	public static final String Q_AC_ITEM = "cm.purplemoney.members.ent.vo.MemberVO.QAutocompleteItem";
	public static final String ALL = "cm.purplemoney.members.ent.vo.MemberVO.All";
	public static final String FINDBYID="cm.purplemoney.members.ent.vo.MemberVO.findById";
	public static final String  FINDBYSESSION="cm.purplemoney.members.ent.vo.MemberVO.findByName";

	@EmbeddedId
	public MemberIdVO getId(){return id;}

	@Basic(optional = false)
	@Column(name="SURNAME",nullable = false,length = FieldConstants.SURNAME__STD_LEN)
	public String getSurname() {
		return surname;
	}

	@Basic(optional = false)
	@Column(name="PHONE",nullable = false,length = FieldConstants.PHONE_LEN)
	public String getPhone() {
		return phone;
	}


	@Basic(optional = true)
	@Column(name="EMAIL",nullable = true)
	public String getEmail() {
		return email;
	}

	@Basic(optional = true)
	@Column(name="ADDRESS",nullable=true ,length = FieldConstants.ADDRESS_LEN)
	public String getAddress() {
		return address;
	}


	@Basic(optional = false)
	@Column(name="ROLE",nullable = true,length = FieldConstants.ROLE_LEN)
	public String getRole() {
		return role;
	}

	@Basic(optional = false)
	@Column(name="SEXE",nullable = true,length = FieldConstants.SEX_STD_LEN)
	//@Enumerated(EnumType.STRING)
	public String getSex() {
		return sex;
	}


	@Basic(optional=false)
	@Column(name="ACTIVE")
	public boolean isActive() {
		return active;
	}

	@Basic(optional=false)
	@Column(name="ADMIN")
	public boolean isAdmin() {
		return admin;
	}

	@Basic(optional=false)
	@Column(name="R_ASSOCIATION")
	public String getAssociation() {
		return association;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumns({
			@JoinColumn(name = "ID", referencedColumnName = "R_ASSOCIATION",insertable=false, updatable=false),
			@JoinColumn(name = "MNAME", referencedColumnName ="R_MEMBER" ,insertable=false, updatable=false)
	})
	public EventVO getEvent() {
		return event;
	}

	@OneToMany(mappedBy = "member",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@OrderBy("description DESC")
	public Set<SanctionVO> getSanctions() {
		return sanctions;
	}


	@OneToMany(mappedBy = "membre",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@OrderBy("id.date  DESC")
	public Set<SessionVO> getSessions() {
		return sessions;
	}

	public void setEvent(EventVO event) {
		this.event = event;
	}

	public void setSanctions(Set<SanctionVO> sanctions) {
		this.sanctions = sanctions;
	}

	public void setSessions(Set<SessionVO> sessions) {
		this.sessions = sessions;
	}

	public void setAssociation(String association) {
		this.association = association;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setId(MemberIdVO id) {
		this.id = id;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Transient
	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	@Transient
	public String getSexDesc() {
		return sexDesc;
	}

	public void setSexDesc(String sexDesc) {
		this.sexDesc = sexDesc;
	}

    @Transient
    public String getAssociationDesc() {
        return associationDesc;
    }

    public void setAssociationDesc(String associationDesc) {
        this.associationDesc = associationDesc;
    }

	@Transient
	public boolean isMale() {
		return male;
	}

	public void setMale(boolean male) {
		this.male = male;
	}

    /*
	public String getConfirmedPassword() {
		return confirmedPassword;
	}

	@Transient
	public void setConfirmedPassword(String confirmedPassword) {
		this.confirmedPassword = confirmedPassword;
	}*/
}
