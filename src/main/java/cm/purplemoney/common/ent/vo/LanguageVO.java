package cm.purplemoney.common.ent.vo;



import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="LANGUAGES" , schema="PUBLIC")
@NamedQueries({
        @NamedQuery(name = LanguageVO.findById,query ="select l from LanguageVO l  where id =:id" ),
})
public class LanguageVO implements Serializable {

    private String id;
    private String country;
    private String description;

    public static  final String findById="cm.purplemoney.common.ent.vo.LanguageVO.findById";

    @Id
    @Basic(optional = false)
    @Column(name = "ID",nullable = false,length = 2)
    public String getId() {
        return id;
    }

    @Basic(optional = false)
    @Column(name = "COUNTRY_CODE",nullable = false,length = 2)
    public String getCountry() {
        return country;
    }

    @Basic(optional = false)
    @Column(name = "VALUE")
    public String getDescription() {
        return description;
    }


    public void setId(String id) {
        this.id = id;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
