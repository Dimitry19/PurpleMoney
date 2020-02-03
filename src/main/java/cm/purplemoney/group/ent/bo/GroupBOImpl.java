package cm.purplemoney.group.ent.bo;

import cm.purplemoney.common.ent.bo.CommonBOImpl;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.group.ent.vo.GroupVO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.util.List;


@Component("groupBO")
public class GroupBOImpl  extends CommonBOImpl implements GroupBO {



    public List<GroupVO> loadAllGroups() {

        session=hibernateConfig.getSession();
        Query query=session.createQuery("from GroupVO");
        return query.list();
    }

    @Override
    public void addGroup(GroupVO group) {
          session=hibernateConfig.getSession();
        Transaction tx=session.beginTransaction();
        session.save(GroupVO.class.getName(), group);

        tx.commit();
    }
}
