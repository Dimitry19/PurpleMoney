package cm.purplemoney.event.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.event.ent.vo.EventVO;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("eventBO")
public class EventBOImpl implements EventBO {

    @Override
    public List<EventVO> program() throws BusinessException {
        return null;
    }
}
