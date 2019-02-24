package cm.purplemoney.login.usr.action;

import cm.purplemoney.common.usr.action.BaseAction;
import org.apache.struts2.interceptor.ServletResponseAware;
import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;




public class PortalAction extends  BaseAction  implements Preparable,ServletResponseAware,ServletRequestAware{

	private static final long serialVersionUID = -3369875299120377549L;
	
	private Logger logger = LoggerFactory.getLogger(PortalAction.class);
	

    
	@Override
	public void prepare() throws Exception {
		
	}
	@Override
	public String execute() throws Exception{
		
		return SUCCESS;
	}

	
	public String home() throws Exception{
		
		return SUCCESS;
	}
	
	public String logout() throws Exception{
		
		// TODO gerer la cancellazione dei cookie
		return SUCCESS;
	}


	private HttpServletResponse response;
	private HttpServletRequest request;

	private String disclaimerCookieDomain;
	private Integer disclaimerCookieValidity;

	private Boolean showDisclaimer = Boolean.TRUE;

	public String getDisclaimerCookieDomain() {
		return disclaimerCookieDomain;
	}

	public void setDisclaimerCookieDomain(String disclaimerCookieDomain) {
		this.disclaimerCookieDomain = disclaimerCookieDomain;
	}

	public Integer getDisclaimerCookieValidity() {
		return disclaimerCookieValidity;
	}

	public void setDisclaimerCookieValidity(Integer disclaimerCookieValidity) {
		this.disclaimerCookieValidity = disclaimerCookieValidity;
	}

	public Boolean getShowDisclaimer() {
		return showDisclaimer;
	}

	public void setShowDisclaimer(Boolean showDisclaimer) {
		this.showDisclaimer = showDisclaimer;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	

}