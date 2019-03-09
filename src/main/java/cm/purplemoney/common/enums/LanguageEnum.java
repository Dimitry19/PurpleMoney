package cm.purplemoney.common.enums;


import org.apache.commons.lang3.StringUtils;

public enum LanguageEnum {
    IT("it", "Italian"),
    EN("en", "English"),
    FR("fr", "French");

    private String value;
    private String  description;

    private LanguageEnum(String value, String description) {
        this.value = value;
        this.description = description;
    }

    public String toValue() {
        return value;
    }

    public String toDescription() {
        return description;
    }

    public static LanguageEnum fromValue(String value){
        if(StringUtils.isEmpty(value)){
            return null;
        }

        for (LanguageEnum e : values()) {
            if(e.value.equals(value)){
                return e;
            }
        }

        throw new RuntimeException(value + " valore non valido");
    }

    public static LanguageEnum fromDescription(String value){

        if(StringUtils.isNotEmpty(value)){
            if(StringUtils.equals(value,"French")) return FR;
            if(StringUtils.equals(value,"Italian")) return  IT;
            if(StringUtils.equals(value,"English")) return EN;
        }
        return null;
    }
}
