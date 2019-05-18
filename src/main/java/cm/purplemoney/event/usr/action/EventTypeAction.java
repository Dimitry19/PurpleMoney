package cm.purplemoney.event.usr.action;


import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.event.ent.bo.EventTypeBO;
import cm.purplemoney.event.ent.vo.EventTypeVO;
import com.opensymphony.xwork2.Preparable;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("eventTypeAction")
@Scope("prototype")
public class EventTypeAction extends BaseAction implements SessionAware,Preparable{
	private static final Logger log = LoggerFactory.getLogger(EventTypeAction.class);

	private static final long serialVersionUID = 1L;
	private EventTypeVO eventType;
	private AssociationVO associationCurrent;
	private List eventTypes;


	@Resource(name = "eventTypeBO")
	private EventTypeBO eventTypeBO;

	@Resource(name = "associationBO")
	private AssociationBO associationBO;

	@Override
	public void prepare() throws Exception{

		if (log.isDebugEnabled()){
			debugMessageCall();
		}

		associationCurrent=associationBO.associationInfoFromMember(getCurrentMember());

	}
	
	public String execute() {
		return SUCCESS;
	}
	 
	public String addEventType() throws Exception{

		eventTypeBO.addEventType(eventType);
		return SUCCESS;
	}

	public String allEventTypes() throws Exception{

		eventTypes=eventTypeBO.allEventsType(getCurrentLocale().toLowerCase().trim());
		return SUCCESS;
	}
	 
	public String index() {
	return SUCCESS;
	}
	 
	public String delete() {

		return SUCCESS;
	}

	public List getEventTypes() {
		return eventTypes;
	}

	public void setEventTypes(List eventTypes) {
		this.eventTypes = eventTypes;
	}

	public EventTypeVO getEventType() {
		return eventType;
	}

	public void setEvent(EventTypeVO eventType) {
		this.eventType = eventType;
	}

	public AssociationVO getAssociationCurrent() {
		return associationCurrent;
	}

	public void setAssociationCurrent(AssociationVO associationCurrent) {
		this.associationCurrent = associationCurrent;
	}

}
