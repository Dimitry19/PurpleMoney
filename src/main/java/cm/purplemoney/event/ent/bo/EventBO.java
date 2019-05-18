package cm.purplemoney.event.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.event.ent.vo.EventVO;

import java.util.List;

public interface EventBO {
    List<EventVO> allEvents() throws BusinessException;
    void addEvent(EventVO event) throws BusinessException;
    void deleteEvent(EventVO event) throws BusinessException;

}
