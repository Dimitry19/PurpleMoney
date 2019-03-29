package cm.purplemoney.event.ent.vo;

import cm.purplemoney.constants.FieldConstants;
import cm.purplemoney.members.ent.vo.MemberVO;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "SCHEDULE", schema = "PUBLIC")
public class EventVO implements Serializable {

  //  private ProgramIdVO id;
    private Set<MemberVO> members= new HashSet<MemberVO>();


    private int id;
    private String associationId;
    private Date data;
    private String member;

    @Id
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

    @Basic(optional = false)
    @Column(name="R_MEMBER", length = FieldConstants.NAME_STD_LEN)
    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member;
    }

    public void setData(Date data) {
        this.data = data;
    }


    @OneToMany(mappedBy = "program",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    public Set<MemberVO> getMembers() {
        return members;
    }


    public void setMembers(Set<MemberVO> members) {
        this.members = members;
    }

}
