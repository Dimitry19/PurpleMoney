package cm.purplemoney.event.ent.vo;

import cm.purplemoney.constants.FieldConstants;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "EVENT_TYPE", schema = "PUBLIC")
@NamedQueries({
        @NamedQuery(name = EventTypeVO.ALL, query = "select k from EventTypeVO k  where language=:lang order by id"),
})
public class EventTypeVO implements Serializable {

    private String id ;
    private String language;
    private String description;

    public static final String ALL = "cm.purplemoney.event.ent.vo.EventTypeVO.All";


    @Id
    @Basic(optional = false)
    @Column(name="EVENT_ID", nullable = false,length = 8)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
