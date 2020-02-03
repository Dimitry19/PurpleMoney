package cm.purplemoney.event.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.bo.CommonBO;
import cm.purplemoney.event.ent.vo.EventTypeVO;
import java.util.List;

public interface EventTypeBO extends CommonBO {
    List<EventTypeVO> allEventsType(String lang) throws BusinessException;
    void addEventType(EventTypeVO eventType) throws BusinessException;

}
