package cm.purplemoney.sanction.ent.vo;

import cm.purplemoney.constants.FilterConstants;
import cm.purplemoney.members.ent.vo.MemberVO;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;

import static org.eclipse.jdt.core.JavaCore.IGNORE;

@Entity
@Table(name ="SANCTION", schema = "PUBLIC")
@NamedQueries({
        @NamedQuery(name = SanctionVO.Q_AC_ITEM, query = "select s from SanctionVO s where (description like :searchFilter) or(upper(description) like :" +
                "searchFilter )   order by description"),
        @NamedQuery(name = SanctionVO.ALL, query = "select s from SanctionVO s  order by description"),
        @NamedQuery(name = SanctionVO.FINDBYMEMBER, query = "select s from SanctionVO s where s.member.id.name =:mname  order by description"),
})
@Filters({
        @Filter(name = FilterConstants.ASSOCIATION)
})
public class SanctionVO {

    private SanctionIdVO id;
    private String description;
    private MemberVO member;

    public static final String Q_AC_ITEM = "cm.purplemoney.sanction.ent.vo.SanctionVO.QAutocompleteItem";
    public static final String ALL = "cm.purplemoney.sanction.ent.vo.SanctionVO.All";
    public static final String FINDBYMEMBER="cm.purplemoney.sanction.ent.vo.SanctionVO.findByMemb";

    @EmbeddedId
    public SanctionIdVO getId() {
        return id;
    }

    public void setId(SanctionIdVO id) {
        this.id = id;
    }

    @Basic(optional = false)
    @Column(name="DESCRIPTION", nullable = false)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @NotFound(action=NotFoundAction.IGNORE)
    @ManyToOne
    @JoinColumns({
           @JoinColumn(name = "R_MEMBER", referencedColumnName ="MNAME" ,insertable=false, updatable=false),
            @JoinColumn(name = "R_ASSOCIATION", referencedColumnName = "R_ASSOCIATION",insertable=false, updatable=false)
    })
    public MemberVO getMember() {
        return member;
    }

    public void setMember(MemberVO member) {
        this.member = member;
    }
}
