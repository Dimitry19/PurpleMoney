package cm.purplemoney.interceptors;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import org.apache.struts2.interceptor.I18nInterceptor;


import java.util.Locale;
import java.util.Map;

import static cm.purplemoney.constants.PortalConstants.CURRENT_USER;
import static cm.purplemoney.constants.PortalConstants.LOCALE;
import static cm.purplemoney.constants.PortalConstants.LOGIN_REDIRECT;

public class CommonInterceptor implements Interceptor {

	private static final long serialVersionUID = -5011962009065225959L;

	public void destroy() {
		//release resources here
	}

	
	public void init() {
		// create resources here
	}

	public String intercept(ActionInvocation actionInvocation)
			throws Exception {
		System.out.println("inside common interceptor");
		Map<String, Object> sessionAttributes = actionInvocation.getInvocationContext().getSession();

		if (actionInvocation.getInvocationContext().getName().equals("login")){
			Locale currentLocale=Locale.getDefault();
			Object o=sessionAttributes.get(LOCALE);
			Locale currentLocation  =(Locale) o;
			if(currentLocation!=null) currentLocale=currentLocation;

			ActionContext.getContext().setLocale(currentLocale);
			sessionAttributes.put(I18nInterceptor.DEFAULT_SESSION_ATTRIBUTE, currentLocale);
			return actionInvocation.invoke();
		}


		if (sessionAttributes==null ){
			 return LOGIN_REDIRECT;
		}


		return actionInvocation.invoke();
	}
}
