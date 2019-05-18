package cm.purplemoney.event.ent.vo;

import cm.purplemoney.constants.FieldConstants;
import cm.purplemoney.members.ent.vo.MemberVO;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "EVENTS", schema = "PUBLIC")
@NamedQueries({
        @NamedQuery(name = EventVO.ALL, query = "select k from EventTypeVO k  order by eventCode"),
})
public class EventVO implements Serializable {

  //  private ProgramIdVO id;
    private Set<MemberVO> members= new HashSet<MemberVO>();

    public static final String ALL = "cm.purplemoney.event.ent.vo.EventVO.All";


    private int id;
    private String associationId;
    private Date data;
    private String member;
    private EventTypeVO eventType;

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
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

    @Basic(optional = false)
    @Column(name="R_MEMBER", length = FieldConstants.NAME_STD_LEN)
    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member;
    }

    @OneToMany(mappedBy = "event",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    public Set<MemberVO> getMembers() {
        return members;
    }


    public void setMembers(Set<MemberVO> members) {
        this.members = members;
    }

    @OneToOne(optional=false)
    @JoinColumn(name = "R_EVENT_TYPE")
    public EventTypeVO getEventType() {
        return eventType;
    }

    public void setEventType(EventTypeVO eventType) {
        this.eventType = eventType;
    }
}
