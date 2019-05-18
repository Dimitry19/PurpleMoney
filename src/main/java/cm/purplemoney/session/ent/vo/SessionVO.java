package cm.purplemoney.session.ent.vo;

import cm.purplemoney.members.ent.vo.MemberVO;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;


@Entity
@Table(name="SESSION" , schema="PUBLIC")
@NamedQueries({
        @NamedQuery(name = SessionVO.ALL, query = "select s from SessionVO s where id.associationId=:ass order by membre.id.name"),
       // @NamedQuery(name = SessionVO.ALL, query = "select s from SessionVO s where id.associationId=:ass order by id.member"),
})
public class SessionVO implements Serializable {

    private SessionIdVO id;
    private BigInteger amount;
    private boolean status;
    private String surnameMember;
    private MemberVO membre;

    public static final String ALL = "cm.purplemoney.session.ent.vo.SessionVO.All";

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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumns({
            @JoinColumn(name = "R_MEMBER", referencedColumnName ="MNAME" ,insertable=false, updatable=false),
            @JoinColumn(name = "R_ASSOCIATION", referencedColumnName = "ID",insertable=false, updatable=false)
    })
    public MemberVO getMembre() {
        return membre;
    }

    public void setMembre(MemberVO membre) {
        this.membre = membre;
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
