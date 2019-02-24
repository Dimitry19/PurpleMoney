package cm.purplemoney.group.ent.vo;


import cm.purplemoney.constants.FieldConstants;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="GROUPS", schema = "PUBLIC")//@Table(name="GROUP" , schema="PURPLEMONEY")
public class GroupVO implements Serializable {

    private String  id;
    private String description;
    private boolean active;



    @Id
    @Basic(optional = false)
    @Column(name="ID", nullable = false, length = FieldConstants.ID_STD_LEN)
    //@RequiredStringValidator(message = "Selectioner le groupe")
    public String getId() {
        return id;
    }


    @Basic(optional = false)
    @Column(name = "DESCRIPTION", nullable = false)
    public String getDescription() {
        return description;
    }

    @Basic(optional=false)
    @Column(name="ACTIVE")
    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setId(String id) {
        this.id = id;
    }
}
