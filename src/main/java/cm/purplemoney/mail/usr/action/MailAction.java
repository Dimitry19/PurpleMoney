package cm.purplemoney.mail.usr.action;

import cm.purplemoney.common.usr.action.BaseAction;
import com.opensymphony.xwork2.Preparable;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("mailAction")
@Scope("prototype")
public class MailAction extends BaseAction implements SessionAware,Preparable {

    @Override
    public void prepare() throws Exception{

    }

    public String execute() {
        return SUCCESS;
    }


    public String mailSender(){

        return SUCCESS;
    }

}
