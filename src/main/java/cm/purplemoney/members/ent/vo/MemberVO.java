package cm.purplemoney.members.ent.vo;

import java.io.Serializable;

import cm.purplemoney.constants.FieldConstants;
import cm.purplemoney.members.ent.enums.SexEnum;
import cm.purplemoney.profile.ent.vo.AuthUserVO;
import cm.purplemoney.role.ent.vo.RoleVO;
import com.opensymphony.xwork2.validator.annotations.EmailValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import org.hibernate.annotations.JoinFormula;

import javax.persistence.*;


@Entity
@Table(name="MEMBER" , schema="PUBLIC")
@NamedQueries({
@NamedQuery(name = MemberVO.Q_AC_ITEM, query = "select m from MemberVO m where (upper(id.name) like :searchFilter) or(upper(surname) like :" +
		"searchFilter ) or(id.name like :searchFilter) or( surname like :searchFilter) order by m.id.name"),
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


	public static final String Q_AC_ITEM = "cm.purplemoney.members.ent.vo.MemberVO.QAutocompleteItem";
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
/*
	public String getConfirmedPassword() {
		return confirmedPassword;
	}

	@Transient
	public void setConfirmedPassword(String confirmedPassword) {
		this.confirmedPassword = confirmedPassword;
	}*/
}
