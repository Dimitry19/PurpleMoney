package cm.purplemoney.role.ent.vo;

import cm.purplemoney.constants.FieldConstants;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class RoleVOId  implements Serializable {

    private String  id;
    private String  role;

    @Basic(optional = false)
    @Column(name="ID", nullable = false, length = FieldConstants.ID_STD_LEN)
    public String getId(){return id;}

    public void setId(String id) {
        this.id = id;
    }

    @Basic(optional=false)
    @Column(name="ROLE", nullable = false, length = FieldConstants.ID_STD_LEN)
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
