package cm.purplemoney.event.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.bo.CommonBO;
import cm.purplemoney.event.ent.vo.EventVO;

import java.util.List;

public interface EventBO extends CommonBO {
    List<EventVO> allEvents(String association) throws BusinessException;
    void addEvent(EventVO event) throws BusinessException;
    void deleteEvent(EventVO event) throws BusinessException;

}
