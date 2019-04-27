package cm.purplemoney.session.ent.wrapper;

import cm.purplemoney.members.ent.vo.MemberVO;

import java.io.Serializable;
import java.util.Date;


public class SessionSearchWr implements Serializable{


    private String companyId;
    private MemberVO member;
    private boolean status;
    private Date from;
    private Date to;

    public Date getFrom() {
        return this.from;
    }

    public Date getTo() {
        return to;
    }


    public MemberVO getMember() {
        return member;
    }

    public void setMember(MemberVO member) {
        this.member = member;
    }

    public void setFrom(Date from) {

        if(from!=null)
            this.from = from;
        else
            this.from=null;

    }

    public void setTo(Date to) {

        if(to!=null)
            this.to = to;
        else
            this.to=null;//DateUtils.getStringToDate();


    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
