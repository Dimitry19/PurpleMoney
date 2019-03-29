package cm.purplemoney.event.ent.vo;

import cm.purplemoney.constants.FieldConstants;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Embeddable
public class ProgramIdVO implements Serializable {

    private int id;
    private String associationId;
    private Date data;


    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "ID", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic(optional = false)
    @Column(name="R_ASSOCIATION", nullable = false,length = FieldConstants.ID_STD_LEN)
    public String getAssociationId() {
        return associationId;
    }

    public void setAssociationId(String associationId) {
        this.associationId = associationId;
    }

    @Basic(optional = false)
    @Column(name = "DATE")
    @Temporal(TemporalType.DATE)
    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProgramIdVO that = (ProgramIdVO) o;

        if (id!=that.id) return false;
        return associationId.equals(that.associationId);
    }

    @Override
    public int hashCode() {
        int result = associationId.hashCode();
        return result;
    }

}
