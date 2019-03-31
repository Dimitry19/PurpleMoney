package cm.purplemoney.session.ent.vo;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;


@Entity
@Table(name="SESSION" , schema="PUBLIC")
public class SessionVO implements Serializable {

    private SessionIdVO id;
    private BigInteger amount;
    private boolean status;
    private String surnameMember;

    @EmbeddedId
    public SessionIdVO getId() {
        return id;
    }

    @Basic(optional = false)
    @Column(name = "STATUS")
       public boolean isStatus() {
        return status;
    }

    @Basic(optional = false)
    @Column(name = "R_AMOUNT")
    public BigInteger getAmount() {
        return amount;
    }

    @Transient
    public String getSurnameMember() {
        return surnameMember;
    }

    public void setSurnameMember(String surnameMember) {
        this.surnameMember = surnameMember;
    }

    public void setAmount(BigInteger amount) {
        this.amount = amount;
    }


    public void setId(SessionIdVO id) {
        this.id = id;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
