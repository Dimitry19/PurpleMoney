package cm.purplemoney.role.ent.vo;


import cm.purplemoney.constants.FilterConstants;
import cm.purplemoney.members.ent.vo.MemberVO;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.Filters;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="ROLE" , schema="PUBLIC")
@NamedQueries({
        @NamedQuery(name = RoleVO.QUERY_AVAILABE_ROLE,query = "select r from RoleVO r where r.used = false  and defaultMember=true order by id.role asc"),
        @NamedQuery(name = RoleVO.QUERY_UPDATE_ROLE,query = "update  from RoleVO r set r.used = true where id.role =:role"),
        @NamedQuery(name = RoleVO.Q_AC_ITEM, query = "select r from RoleVO r where (upper(description) like :searchFilter ) and (r.used = false  and defaultMember=true) order by id.role"),
})
@Filters({
        @Filter(name = FilterConstants.ASSOCIATION)
})
public class RoleVO implements Serializable {

    public static final String  QUERY_AVAILABE_ROLE="cm.purplemoney.role.ent.vo.RoleVO.RoleAvaible";
    public static final String  QUERY_UPDATE_ROLE="cm.purplemoney.role.ent.vo.RoleVO.UpdateRole";
    public static final String Q_AC_ITEM = "cm.purplemoney.role.ent.vo.RoleVO.QAutocompleteItem";

    private RoleVOId id;
    private String description;
    private boolean used;
    private boolean defaultMember;

    @EmbeddedId
    public RoleVOId getId() {
        return id;
    }

    public void setId(RoleVOId id) {
        this.id = id;
    }

    @Basic(optional = false)
    @Column(name = "DESCRIPTION", nullable = false)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic(optional = false)
    @Column(name = "USED", nullable = false)
    public boolean isUsed() {
        return used;
    }

    public void setUsed(boolean used) {
        this.used = used;
    }

    @Basic(optional = false)
    @Column(name = "DEFAUT_MBR")
    public boolean isDefaultMember() {
        return defaultMember;
    }

    public void setDefaultMember(boolean defaultMember) {
        this.defaultMember = defaultMember;
    }
}
