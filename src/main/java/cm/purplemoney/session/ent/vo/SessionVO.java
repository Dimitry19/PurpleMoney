package cm.purplemoney.session.ent.vo;

import cm.purplemoney.constants.FilterConstants;
import cm.purplemoney.members.ent.vo.MemberVO;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;


@Entity
@Table(name="SESSION" , schema="PUBLIC")
@NamedQueries({
        @NamedQuery(name = SessionVO.ALL, query = "select s from SessionVO s order by s.id.date asc"),
})
@Filters({
        @Filter(name = FilterConstants.ASSOCIATION)
})
public class SessionVO implements Serializable {

    private SessionIdVO id;
    private BigInteger amount;
    private boolean status;
    private String frequence;
    private String surnameMember;
    private MemberVO mmember;
    private Integer frequencePresence;
    private Integer frequenceAbsence;

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

    @NotFound(action=NotFoundAction.IGNORE)
    @ManyToOne
    @JoinColumns({
            @JoinColumn(name = "R_MEMBER", referencedColumnName ="MNAME" ,insertable=false, updatable=false),
            @JoinColumn(name = "R_ASSOCIATION", referencedColumnName = "R_ASSOCIATION",insertable=false, updatable=false)
    })
    public MemberVO getMmember() {
        return mmember;
    }

    public void setMmember(MemberVO mmember) {
        this.mmember = mmember;
    }

    @Basic(optional = false)
    @Column(name = "FREQUENCE")
    public String getFrequence() {
        return frequence;
    }

    public void setFrequence(String frequence) {
        this.frequence = frequence;
    }

    @Transient
    public String getSurnameMember() {
        return surnameMember;
    }

    @Transient
    public Integer getFrequencePresence() {
        return frequencePresence;
    }

    public void setFrequencePresence(Integer frequencePresence) {
        this.frequencePresence = frequencePresence;
    }

    @Transient
    public Integer getFrequenceAbsence() {
        return frequenceAbsence;
    }

    public void setFrequenceAbsence(Integer frequenceAbsence) {
        this.frequenceAbsence = frequenceAbsence;
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
