package cam.libraries.component.ent.bo;

import java.io.Serializable;
import java.util.List;
import cam.libraries.component.persistence.common.PageBy;
import cam.libraries.component.persistence.common.SortBy;
import cam.libraries.component.ent.vo.BusinessException;

public interface GenericBO<T, ID extends Serializable, NID extends Serializable> extends BusinessObject {
    T findById(ID var1) throws BusinessException;

    T findByNaturalId(NID var1) throws BusinessException;

    List<T> findByIds(ID[] var1) throws BusinessException;

    List<T> findByNaturalIds(NID[] var1) throws BusinessException;

    List<T> findByExample(T var1, PageBy var2, SortBy var3, Boolean var4) throws BusinessException;

    List<T> loadAll(int var1, int var2) throws BusinessException;

    T save(T var1, boolean var2) throws BusinessException;

    T update(T var1, boolean var2) throws BusinessException;

    T unsafeSave(T var1) throws BusinessException;

    T unsafeUpdate(T var1) throws BusinessException;

    T saveOrUpdate(T var1) throws BusinessException;

    void delete(T var1, boolean var2) throws BusinessException;

    void unsafeDelete(T var1) throws BusinessException;

    void deleteById(ID var1) throws BusinessException;

    long count() throws BusinessException;

    long countByExample(T var1, Boolean var2) throws BusinessException;

    T merge(T var1) throws BusinessException;

    T refresh(T var1) throws BusinessException;

    void validateUpdate(T var1, boolean var2) throws BusinessException;

    void validateSave(T var1, boolean var2) throws BusinessException;

    void validateDelete(T var1, boolean var2) throws BusinessException;

    void validateWizard(T var1, int var2) throws BusinessException;

    T materialize(T var1, MaterializeByEnum var2, MaterializationFailEnum var3) throws BusinessException;

    T checkAndResolve(T var1) throws BusinessException;
}
