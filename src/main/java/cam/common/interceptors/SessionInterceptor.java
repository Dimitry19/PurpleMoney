package cam.common.interceptors;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Map;
import static cm.purplemoney.constants.PortalConstants.*;


public class SessionInterceptor implements  Interceptor {

    private static final Logger log = LoggerFactory.getLogger(SessionInterceptor.class);
    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        ActionContext context = actionInvocation.getInvocationContext();

        Map<String, Object> sessionMap = context.getSession();

        log.info(" retrived session..."+ sessionMap);
        if(sessionMap == null || sessionMap.isEmpty() || sessionMap.get(TO_SESSION)==null) {
            log.info(" session expired...");
            return EXPIRED_SESSION;
        }
        return  actionInvocation.invoke();
    }
}
