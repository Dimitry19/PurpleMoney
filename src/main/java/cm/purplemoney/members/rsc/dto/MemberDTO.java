package cm.purplemoney.members.rsc.dto;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.Serializable;

public class MemberDTO implements Serializable {


    @JsonProperty("esito")
    private String result;


    public int decodeStringList(String[] res) {
        return 0;
    }

    public String getResult() {	return result;	}

    public void setResult(String result) {this.result = result;}
}
