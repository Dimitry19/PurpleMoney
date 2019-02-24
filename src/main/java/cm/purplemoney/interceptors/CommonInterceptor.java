package cm.purplemoney.interceptors;

import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.profile.ent.vo.AuthUserVO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import org.apache.struts2.interceptor.I18nInterceptor;

import java.util.Locale;
import java.util.Map;

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

		Locale currentLocale=Locale.getDefault();

		ActionContext.getContext().setLocale(currentLocale);
		sessionAttributes.put(I18nInterceptor.DEFAULT_SESSION_ATTRIBUTE, currentLocale);

		return actionInvocation.invoke();
	}

}
