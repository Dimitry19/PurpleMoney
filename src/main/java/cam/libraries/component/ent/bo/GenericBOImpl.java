package cam.libraries.component.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cam.libraries.component.persistence.common.PageBy;
import cam.libraries.component.persistence.common.SortBy;

import java.io.Serializable;
import java.util.List;

public   class GenericBOImpl implements GenericBO {

    @Override
    public Object findById(Serializable var1) throws BusinessException {
        return null;
    }

    @Override
    public Object findByNaturalId(Serializable var1) throws BusinessException {
        return null;
    }

    @Override
    public List findByIds(Serializable[] var1) throws BusinessException {
        return null;
    }

    @Override
    public List findByNaturalIds(Serializable[] var1) throws BusinessException {
        return null;
    }

    @Override
    public List findByExample(Object var1, PageBy var2, SortBy var3, Boolean var4) throws BusinessException {
        return null;
    }

    @Override
    public List loadAll(int var1, int var2) throws BusinessException {
        return null;
    }

    @Override
    public Object save(Object var1, boolean var2) throws BusinessException {
        return null;
    }

    @Override
    public Object update(Object var1, boolean var2) throws BusinessException {
        return null;
    }

    @Override
    public Object unsafeSave(Object var1) throws BusinessException {
        return null;
    }

    @Override
    public Object unsafeUpdate(Object var1) throws BusinessException {
        return null;
    }

    @Override
    public Object saveOrUpdate(Object var1) throws BusinessException {
        return null;
    }

    @Override
    public void delete(Object var1, boolean var2) throws BusinessException {

    }

    @Override
    public void unsafeDelete(Object var1) throws BusinessException {

    }

    @Override
    public void deleteById(Serializable var1) throws BusinessException {

    }

    @Override
    public long count() throws BusinessException {
        return 0;
    }

    @Override
    public long countByExample(Object var1, Boolean var2) throws BusinessException {
        return 0;
    }

    @Override
    public Object merge(Object var1) throws BusinessException {
        return null;
    }

    @Override
    public Object refresh(Object var1) throws BusinessException {
        return null;
    }

    @Override
    public void validateUpdate(Object var1, boolean var2) throws BusinessException {

    }

    @Override
    public void validateSave(Object var1, boolean var2) throws BusinessException {

    }

    @Override
    public void validateDelete(Object var1, boolean var2) throws BusinessException {

    }

    @Override
    public void validateWizard(Object var1, int var2) throws BusinessException {

    }

    @Override
    public Object materialize(Object var1, MaterializeByEnum var2, MaterializationFailEnum var3) throws BusinessException {
        return null;
    }

    @Override
    public Object checkAndResolve(Object var1) throws BusinessException {
        return null;
    }
}
