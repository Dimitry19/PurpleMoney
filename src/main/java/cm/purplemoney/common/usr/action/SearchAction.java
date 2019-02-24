package cm.purplemoney.common.usr.action;

import com.opensymphony.xwork2.Preparable;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("searchAction")
@Scope("prototype")
public class SearchAction extends BaseAction implements SessionAware,Preparable {

    @Override
    public void prepare() throws Exception {

    }
    @Override
    public String execute() throws Exception{

        return SUCCESS;
    }

    public String search() throws Exception{

        return SUCCESS;
    }
}
