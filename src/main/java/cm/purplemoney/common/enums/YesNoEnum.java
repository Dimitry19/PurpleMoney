package cm.purplemoney.common.enums;

import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;

public enum YesNoEnum {
    YES("Y", Boolean.TRUE),
    NO("N", Boolean.FALSE);

    private String value;
    private Boolean blValue;

    private YesNoEnum(String value, Boolean blValue) {
        this.value = value;
        this.blValue = blValue;
    }

    public String toValue() {
        return value;
    }

    public Boolean toBooleanValue() {
        return blValue;
    }

    public static YesNoEnum fromValue(String value){
        if(StringUtils.isEmpty(value)){
            return null;
        }

        for (YesNoEnum e : values()) {
            if(e.value.equals(value)){
                return e;
            }
        }

        throw new RuntimeException(value + " valore non valido");
    }

    public static YesNoEnum fromBooleanValue(Boolean value){
        return BooleanUtils.isTrue(value)?YES:NO;
    }
}