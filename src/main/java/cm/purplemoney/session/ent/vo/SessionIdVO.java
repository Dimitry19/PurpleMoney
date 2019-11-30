package cm.purplemoney.session.ent.vo;

import cm.purplemoney.constants.FieldConstants;
import javax.persistence.*;
import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;

import cam.common.date.utils.*;
import cm.purplemoney.members.ent.vo.MemberVO;


@Embeddable
public class SessionIdVO implements Serializable{


    private String associationId;
    private String member;
    private Date date;

    public SessionIdVO() {

    }
    public SessionIdVO(MemberVO member, Date date, String associationId ){
        this.associationId=associationId;
        this.date=date;
        //this.membre = member;
    }


    @Basic(optional = false)
    @Column(name="R_ASSOCIATION", nullable = false, length = FieldConstants.ID_STD_LEN)
    public String getAssociationId() {
        return associationId;
    }



    @Basic(optional = false)
    @Column(name="R_MEMBER",nullable = false,length = FieldConstants.NAME_STD_LEN)
   // @RequiredStringValidator(message =" Selectioner le membre")
    public String getMember() {
        return member;
    }

    @Basic(optional = false)
    @Temporal(TemporalType.DATE)
    @Column(name="DATE",nullable = false)
    public Date getDate() {
        return date;
    }

    public void setMember(String member) {
        this.member = member;
    }

    public void setDate(Date date) {


        try {
            this.date = DateUtils.parseDate(DateUtils.formatDate(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public void setAssociationId(String associationId) {
        this.associationId = associationId;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SessionIdVO that = (SessionIdVO) o;

        if (!member.equals(that.member)) return false;
        if (date.compareTo(that.date)!=0) return false;
        return associationId.equals(that.associationId);
    }

    @Override
    public int hashCode() {
        int result = member.hashCode();
        result=31*result+date.hashCode();
        result = 31 * result + associationId.hashCode();

        return result;
    }


}
