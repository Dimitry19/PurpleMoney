package cm.purplemoney.interceptors;

import java.util.Locale;
import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.profile.ent.vo.AuthUserVO;
import org.apache.struts2.interceptor.I18nInterceptor;

public class AuthenticationInterceptor implements Interceptor {

	private static final long serialVersionUID = -5011962009065225959L;

	public void destroy() {
		//release resources here
	}

	
	public void init() {
		// create resources here
	}

	public String intercept(ActionInvocation actionInvocation)
			throws Exception {
		System.out.println("inside auth interceptor");
		Map<String, Object> sessionAttributes = actionInvocation.getInvocationContext().getSession();
		AuthUserVO user =  (AuthUserVO) sessionAttributes.get("USER");

		Locale currentLocale=Locale.getDefault();

		ActionContext.getContext().setLocale(currentLocale);
		sessionAttributes.put(I18nInterceptor.DEFAULT_SESSION_ATTRIBUTE, currentLocale);

		System.out.println("Current Locale: " + Locale.getDefault());
		
		if(user == null){
			return "loginAction";
		}else{
			Action action = (Action) actionInvocation.getAction();
			if(action instanceof AuthUserBO){
				((AuthUserBO) action).login(user.getUsername(), user.getPassword());
			}
			return actionInvocation.invoke();
		}
	}

}
