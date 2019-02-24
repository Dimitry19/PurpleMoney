package cm.purplemoney.profile.ent.vo;

import cm.purplemoney.constants.FieldConstants;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name="LOGIN_USERS", schema = "PUBLIC")
public class AuthUserVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name="AUTH_ID")
	private int authId;

	private String username;

	private String password;

	private String rmember;

	@Transient
	private String association;

	@Transient
	private boolean remember;

	public int getAuthId() {
		return 	 authId;

	}

	public boolean isRemember() {
		return remember;
	}

	public void setRemember(boolean remember) {
		this.remember = remember;
	}

	public void setAuthId(int authId) {
		this.authId = authId;
	}

	@Basic(optional = false)
	@Column(name="USERNAME", nullable=false,length=FieldConstants.AUTH_USER_LEN)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Basic(optional = false)
	@Column(name="PASSWORD", nullable=false)
	public String getPassword() {
		return password;
	}

	@Basic(optional = false)
	@Column(name="RMEMBER", nullable=false)
	public String getRmember() {
		return rmember;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAssociation() {
		return association;
	}

	public void setAssociation(String association) {
		this.association = association;
	}

	public void setRmember(String rmember) {
		this.rmember = rmember;
	}
}
