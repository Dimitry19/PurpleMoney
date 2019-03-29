package cm.purplemoney.event.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.event.ent.vo.EventVO;

import java.util.List;

public interface EventBO {
    List<EventVO> program() throws BusinessException;

}
