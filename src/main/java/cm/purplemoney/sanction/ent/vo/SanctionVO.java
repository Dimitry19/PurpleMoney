package cm.purplemoney.sanction.ent.vo;

import cm.purplemoney.members.ent.vo.MemberVO;
import javax.persistence.*;

@Entity
@Table(name ="SANCTION", schema = "PUBLIC")
@NamedQueries({
        @NamedQuery(name = SanctionVO.Q_AC_ITEM, query = "select s from SanctionVO s where (description like :searchFilter) or(upper(description) like :" +
                "searchFilter )  and id.associationId=:ass order by description"),
        @NamedQuery(name = SanctionVO.ALL, query = "select s from SanctionVO s  where id.associationId=:ass order by description"),
        @NamedQuery(name = SanctionVO.FINDBYMEMBER, query = "select s from SanctionVO s where s.member.id.name =:mname and s.member.id.memberId =:ass order by description"),
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumns({
            @JoinColumn(name = "R_MEMBER", referencedColumnName ="MNAME" ,insertable=false, updatable=false),
            @JoinColumn(name = "R_ASSOCIATION", referencedColumnName = "ID",insertable=false, updatable=false)
    })
    public MemberVO getMember() {
        return member;
    }

    public void setMember(MemberVO member) {
        this.member = member;
    }
}
