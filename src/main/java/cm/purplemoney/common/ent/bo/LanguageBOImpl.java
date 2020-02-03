package cm.purplemoney.common.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.vo.LanguageVO;
import cm.purplemoney.config.HibernateConfig;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("languageBO")
public class LanguageBOImpl extends CommonBOImpl implements LanguageBO{


    @Override
    public List loadAllLanguages() throws BusinessException {
        session=hibernateConfig.getSession();
        Query query=session.createQuery("from LanguageVO");
        return query.list();
    }

    @Override
    public LanguageVO retrieveLanguage(String id) throws BusinessException {
        session=hibernateConfig.getSession();

        Query query =session.getNamedQuery(LanguageVO.findById);
        query.setParameter("id",id);
       return (LanguageVO)query.uniqueResult();

    }
}
