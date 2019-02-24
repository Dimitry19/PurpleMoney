package cam.libraries.component.persistence.common;


import java.io.Serializable;

public class PageBy implements Serializable {
    private static final long serialVersionUID = 1L;
    private int offset;
    private int maxNumberOfItems;

    public PageBy(int offset, int maxNumberOfItems) {
        this.offset = offset;
        this.maxNumberOfItems = maxNumberOfItems;
    }

    public PageBy(Integer offset, Integer maxNumberOfItems) {
        this.offset = offset == null ? 0 : offset;
        this.maxNumberOfItems = maxNumberOfItems == null ? 0 : maxNumberOfItems;
    }

    public int getOffset() {
        return this.offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getMaxNumberOfItems() {
        return this.maxNumberOfItems;
    }

    public void setMaxNumberOfItems(int maxNumberOfItems) {
        this.maxNumberOfItems = maxNumberOfItems;
    }
}