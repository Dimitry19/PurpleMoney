package cam.libraries.component.persistence.common;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SortBy implements Serializable {
    private static final long serialVersionUID = 1L;
    private List<SortItem> sorts = new ArrayList();

    public SortBy() {
    }

    public SortBy addSort(SortItem orderByItem) {
        this.sorts.add(orderByItem);
        return this;
    }

    public SortBy addSort(String propertyName, SortOrderEnum sort, int weight) {
        return this.addSort(new SortItem(propertyName, sort, weight));
    }

    public SortBy addSort(String propertyName, SortOrderEnum sort) {
        return this.addSort(new SortItem(propertyName, sort, this.sorts.size()));
    }

    public SortBy addSort(String propertyName) {
        return this.addSort(propertyName, SortOrderEnum.ASC, this.sorts.size());
    }

    public List<SortItem> getOrderByItems() {
        Collections.sort(this.sorts);
        return this.sorts;
    }
}
