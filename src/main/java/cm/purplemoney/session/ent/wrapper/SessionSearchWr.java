package cm.purplemoney.session.ent.wrapper;

import cm.purplemoney.members.ent.vo.MemberVO;

import java.io.Serializable;
import java.util.Date;


public class SessionSearchWr implements Serializable{


    private String companyId;
    private MemberVO receiver;
    private Date from;
    private Date to;

    public Date getFrom() {
        return this.from;
    }

    public Date getTo() {
        return to;
    }


    public MemberVO getReceiver() {
        return receiver;
    }

    public void setReceiver(MemberVO receiver) {
        this.receiver = receiver;
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
}
