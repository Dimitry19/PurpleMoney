package cm.purplemoney.role.ent.vo;


import cm.purplemoney.constants.FieldConstants;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="ROLE" , schema="PUBLIC")
public class RoleVO implements Serializable {


    private RoleVOId id;
    private String description;

    @EmbeddedId
    public RoleVOId getId() {
        return id;
    }

    public void setId(RoleVOId id) {
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




}
