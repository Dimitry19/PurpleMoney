package cm.purplemoney.common.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.vo.LanguageVO;

import java.util.List;

public interface LanguageBO {

    List loadAllLanguages() throws BusinessException;
    LanguageVO retrieveLanguage(String id) throws BusinessException;
}
