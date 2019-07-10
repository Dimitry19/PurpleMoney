package cm.purplemoney.event.usr.action;


import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.event.ent.bo.EventBO;
import cm.purplemoney.event.ent.bo.EventTypeBO;
import cm.purplemoney.event.ent.vo.EventVO;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.enums.SexEnum;
import cm.purplemoney.members.ent.vo.MemberVO;
import com.opensymphony.xwork2.Preparable;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("eventAction")
@Scope("prototype")
public class EventAction extends BaseAction implements SessionAware,Preparable{
	private static final Logger log = LoggerFactory.getLogger(EventAction.class);

	private static final long serialVersionUID = 1L;
	private MemberVO user;
	private EventVO event;
	private AssociationVO associationCurrent;
	private List eventTypes;
	private List events;
	private String term;
	private String[] membersNames;
	private String eventJson;

	@Resource(name = "eventBO")
	private EventBO eventBO;

	@Resource(name = "eventTypeBO")
	private EventTypeBO eventTypeBO;

	@Resource(name="memberBO")
	private MemberBO memberBO;

	@Resource(name = "associationBO")
	private AssociationBO associationBO;


	@Override
	public void prepare() throws Exception{

		if (log.isDebugEnabled()){
			debugMessageCall();
		}

		//eventTypes=eventTypeBO.allEventsType(getCurrentLocale().toLowerCase().trim());
		//eventBO.allEvents(getCurrentAssociation().toUpperCase());
		associationCurrent=associationBO.associationInfoFromMember(getCurrentMember());

	}

	public void validate(){
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		if(event!=null) {
			if (event.getData()==null) {
				addActionError(getText("event.date.error"));
				//addFieldError("event.data", getText("event.date.error"));
			}
		}
	}
	
	public String execute() {
		return SUCCESS;
	}

	public String allEvents() throws Exception{

		events=eventBO.allEvents(getCurrentAssociation().toUpperCase());
		return SUCCESS;
	}
	 
	public String addEvent() throws Exception{
		System.out.println(getUser());

		eventBO.addEvent(event);
		
		return SUCCESS;
	}
	 
	public String index() {
	return SUCCESS;
	}
	 
	public String delete() {

		return SUCCESS;
	}
	 
	public MemberVO getUser() {
		return user;
	}
		 
	public void setUser(MemberVO usr) {
		this.user = usr;
	}


	public EventVO getEvent() {
		return event;
	}

	public void setEvent(EventVO event) {
		this.event = event;
	}

	public AssociationVO getAssociationCurrent() {
		return associationCurrent;
	}

	public void setAssociationCurrent(AssociationVO associationCurrent) {
		this.associationCurrent = associationCurrent;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String[] getMembersNames() {
		return membersNames;
	}

	public void setMembersNames(String[] membersNames) {
		this.membersNames = membersNames;
	}

	public List getEventTypes() {
		return eventTypes;
	}

	public void setEventTypes(List eventTypes) {
		this.eventTypes = eventTypes;
	}

	public String getEventJson() {
		return eventJson;
	}

	public void setEventJson(String eventJson) {
		eventJson = eventJson;
	}

	public List getEvents() {
		return events;
	}

	public void setEvents(List events) {
		this.events = events;
	}
}
