package cm.purplemoney.event.ent.vo;

import cm.purplemoney.constants.FieldConstants;
import cm.purplemoney.members.ent.vo.MemberVO;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "EVENT_TYPE", schema = "PUBLIC")
@NamedQueries({
        @NamedQuery(name = EventTypeVO.ALL, query = "select k from EventTypeVO k  where language=:lang order by eventCode"),
})
public class EventTypeVO implements Serializable {


    private int id;
    private String eventCode ;
    private String language;
    private String description;

    public static final String ALL = "cm.purplemoney.event.ent.vo.EventTypeVO.All";

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
    @Column(name="EVENT_ID", nullable = false,length = 8)
    public String getEventCode() {
        return eventCode;
    }

    public void setEventCode(String eventCode) {
        this.eventCode = eventCode;
    }

    @Basic(optional = false)
    @Column(name="R_LANGUAGE", nullable = false,length = 2)
    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    @Basic(optional = false)
    @Column(name="DESCRIPTION", length = FieldConstants.NAME_STD_LEN)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
