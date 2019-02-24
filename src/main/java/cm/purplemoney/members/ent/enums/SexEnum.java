package cm.purplemoney.members.ent.enums;

import org.apache.commons.lang3.StringUtils;

public enum SexEnum {
        M("HOMME"),
        F("FEMME");


    private String desc;   /* Utiliser pour la  listValue du tag s:select */
    private SexEnum(String nome) {
        this.desc = nome;
    }
    public String getDome() {
        return desc;
    }
}

