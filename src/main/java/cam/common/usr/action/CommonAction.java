package cam.common.usr.action;


import cm.purplemoney.common.ent.vo.WidgetVO;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import com.opensymphony.xwork2.ActionSupport;

import java.math.BigDecimal;
import java.util.*;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.I18nInterceptor;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.ObjectError;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import static cm.purplemoney.constants.PortalConstants.CURRENT_ASS;
import static cm.purplemoney.constants.PortalConstants.CURRENT_USER;
import static cm.purplemoney.constants.PortalConstants.CURRENT_USER_WIDGET;


public class CommonAction extends ActionSupport implements SessionAware ,ServletRequestAware {
    private final Logger log = LoggerFactory.getLogger(this.getClass());
    protected Map session;
    protected Boolean rollbackOnly;
    protected String authCondition;
    protected String profileFilter;
    protected String wildcardMatch;
    protected String fetchProfile;
    protected Collection<String> forceableErrors;
    protected Boolean delegable;
    protected String validationScope;
    protected String validationEntities;
    protected Boolean dataLoad;
    protected String currentUser;
    protected MemberVO currentMember;
    protected WidgetVO widget;
    protected String currentLocale;
    protected String currentAssociation;
    public Locale currlocale;
    protected boolean showNotification=Boolean.TRUE;
    private static final long serialVersionUID = 1L;
    protected String currentAction;
    public HttpServletRequest request;
    protected int tax;




    @Resource(name = "memberBO")
    MemberBO memberBO;


    public CommonAction() {
        this.dataLoad = Boolean.TRUE;
    }

    public Collection<String> translateValidationErrors(List errors) {
        Collection<String> coll = new ArrayList();
        ObjectError error = null;
        String text = null;

        for(int i = 0; i < errors.size(); ++i) {
            error = (ObjectError)errors.get(i);
            text = this.getText(error.getCode(), (String[])((String[])error.getArguments()));
            this.log.debug("validate object name: " + error.getObjectName());
            this.log.debug("validate error code: " + error.getCode());
            this.log.debug("validate error text: " + text);
            coll.add(text);
        }

        return coll;
    }

    protected boolean onBack(String backActionName) throws Exception {
      /* String backAction = backActionName != null ? backActionName : ActionContext.getContext().getName();
        SearchParameterInfo spi = (SearchParameterInfo)this.session.get(backAction);
        if (spi == null) {
            return false;
        } else {
            Iterator i$ = spi.getParameters().entrySet().iterator();

            while(i$.hasNext()) {
                Entry<String, Object> entry = (Entry)i$.next();
                Ognl.setValue((String)entry.getKey(), this, entry.getValue());
            }*/

            this.dataLoad = false;
            return true;
        //}
    }

    protected void debugMessageCall() {
        Logger log = LoggerFactory.getLogger(this.getClass());
        if (log.isDebugEnabled()) {
            Exception e = new Exception();
            log.debug("CALL ON:" + e.getStackTrace()[1].getMethodName() + " " + e.getStackTrace()[1].getClassName() + "<");
        }

    }

    public void setSession(Map m) {
        this.session = m;
    }

    public Map getSession() {
        return this.session;
    }

    public String getAuthCondition() {
        return this.authCondition;
    }

    public void setAuthCondition(String authCondition) {
        this.authCondition = authCondition;
    }

    public Boolean getRollbackOnly() {
        return this.rollbackOnly;
    }

    public void setRollbackOnly(Boolean rollbackOnly) {
        this.rollbackOnly = rollbackOnly;
    }

    public String getProfileFilter() {
        return this.profileFilter;
    }

    public void setProfileFilter(String profileFilter) {
        this.profileFilter = profileFilter;
    }

    public String getWildcardMatch() {
        return this.wildcardMatch;
    }

    public void setWildcardMatch(String wildcardMatch) {
        this.wildcardMatch = wildcardMatch;
    }

    public Collection<String> getActionForceables() {
        return new ArrayList(this.internalGetActionForceables());
    }

    private Collection<String> internalGetActionForceables() {
        if (this.forceableErrors == null) {
            this.forceableErrors = new ArrayList();
        }

        return this.forceableErrors;
    }

    public synchronized void addActionForceables(String aMessage) {
        this.internalGetActionForceables().add(aMessage);
    }

    public String getFetchProfile() {
        return this.fetchProfile;
    }

    public void setFetchProfile(String fetchProfile) {
        this.fetchProfile = fetchProfile;
    }

    public Boolean getDelegable() {
        return this.delegable;
    }

    public void setDelegable(Boolean delegable) {
        this.delegable = delegable;
    }

    public String getValidationScope() {
        return this.validationScope;
    }

    public String getValidationEntities() {
        return this.validationEntities;
    }

    public void setValidationScope(String validationScope) {
        this.validationScope = validationScope;
    }

    public void setValidationEntities(String validationEntities) {
        this.validationEntities = validationEntities;
    }

    public Boolean getDataLoad() {
        return this.dataLoad;
    }

    public void setDataLoad(Boolean dataLoad) {
        this.dataLoad = dataLoad;
    }

    protected String getCurrentUser() {

        Object o=this.session.get(CURRENT_USER);
        currentUser =(String) o;
        return  currentUser;
    }

    protected String getCurrentAssociation() {

        Object o=this.session.get(CURRENT_ASS);
        currentAssociation =(String) o;
        return  currentAssociation;
    }

    public void setCurrentAssociation(String currentAssociation) {
        this.currentAssociation = currentAssociation;
    }

    public void setCurrentUser(String currentUser) {
        this.currentUser = currentUser;
    }

    public String getCurrentLocale() {

        Object o=this.session.get(I18nInterceptor.DEFAULT_SESSION_ATTRIBUTE);
        Locale locale= (Locale)o;
        currentLocale=locale.getLanguage();
        System.out.println(currentLocale);
        return currentLocale;
    }

    public void setCurrentLocale(String currentLocale) {
        this.currentLocale = currentLocale;
    }

    public MemberVO getCurrentMember() {

        return retrieveCurrentMember();
        //return currentMember;
    }

    public void setCurrentMember(MemberVO currentMember) {

        this.currentMember = currentMember;
    }


    public Locale getCurrLocale() {
        return currlocale;
    }

    public void setCurrLocale(Locale currlocale) {
        this.currlocale = currlocale;
    }

    public boolean isShowNotification() {
        return showNotification;
    }

    public void setShowNotification(boolean showNotification) {
        this.showNotification = showNotification;
    }

    private MemberVO retrieveCurrentMember(){

        try {
                Object ob=this.session.get(CURRENT_USER);
                String currentUs =(String) ob;
                Object o=this.session.get(CURRENT_ASS);
                String currentAss =(String) o;

                 Object wob=this.session.get(CURRENT_USER_WIDGET);
                 widget=(WidgetVO)wob;
                 if(widget==null){
                     widget=memberBO.widgetInfo(currentUs,currentAss);
                     this.session.put(CURRENT_USER_WIDGET,widget);
                 }

                return memberBO.findMemberInfo(currentUs,currentAss);
        }catch (Exception b){
                log.error("Error retrieve currentMember");
                b.printStackTrace();
        }
        return null;
    }

    public WidgetVO getWidget() {

        return widget;
    }

    public void setWidget(WidgetVO widget) {
        this.widget = widget;
    }

    public String getCurrentAction() {
        return currentAction;
    }

    public void setCurrentAction(String currentAction) {
        this.currentAction = ServletActionContext.getRequest().getHeader("Referer");
    }

    public int getTax() {
        return tax;
    }

    public void setTax(int tax) {
        this.tax = tax;
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }


}
