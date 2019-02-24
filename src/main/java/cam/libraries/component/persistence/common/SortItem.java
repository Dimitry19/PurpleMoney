package cam.libraries.component.persistence.common;


import java.io.Serializable;

public class SortItem implements Serializable, Comparable<SortItem> {
    private static final long serialVersionUID = 1L;
    private String propertyName;
    private SortOrderEnum sortOrder;
    private int weight;

    public SortItem() {
    }

    public SortItem(String propertyName, SortOrderEnum sortOrder, int weight) {
        this.propertyName = propertyName;
        this.sortOrder = sortOrder;
        this.weight = weight;
    }

    public SortItem(String propertyName, SortOrderEnum sortOrder) {
        this.propertyName = propertyName;
        this.sortOrder = sortOrder;
    }

    public SortItem(String propertyName) {
        this(propertyName, SortOrderEnum.ASC);
    }

    public String getPropertyName() {
        return this.propertyName;
    }

    public SortOrderEnum getSortOrder() {
        return this.sortOrder;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public void setSortOrder(SortOrderEnum sortOrder) {
        this.sortOrder = sortOrder;
    }

    public int getWeight() {
        return this.weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int compareTo(SortItem o) {
        int compare = this.getWeight() - o.getWeight();
        return compare * 10 + Integer.signum(this.propertyName.compareTo(o.getPropertyName()));
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("[super:");
        builder.append(super.toString());
        builder.append("]\n");
        builder.append(this.getClass().getName());
        builder.append(" {\n\t{propertyName:");
        builder.append(this.propertyName);
        builder.append("},\n\t{sortOrder:");
        builder.append(this.sortOrder);
        builder.append("},\n\t{weight:");
        builder.append(this.weight);
        builder.append("}\n}");
        return builder.toString();
    }
}
