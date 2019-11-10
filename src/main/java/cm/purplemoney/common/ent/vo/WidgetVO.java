package cm.purplemoney.common.ent.vo;

import org.json.JSONArray;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class WidgetVO implements Serializable {

	private BigDecimal commonFound;
	private BigDecimal personalFound;
	private BigDecimal loans;
	private BigDecimal sanctions;
	private List<WidgetDataInfoVO> widgetDataInfos;

	public BigDecimal getCommonFound() {
		return commonFound;
	}

	public void setCommonFound(BigDecimal commonFound) {
		this.commonFound = commonFound;
	}

	public BigDecimal getPersonalFound() {
		return personalFound;
	}

	public void setPersonalFound(BigDecimal personalFound) {
		this.personalFound = personalFound;
	}

	public BigDecimal getLoans() {
		return loans;
	}

	public void setLoans(BigDecimal loans) {
		this.loans = loans;
	}

	public BigDecimal getSanctions() {
		return sanctions;
	}

	public void setSanctions(BigDecimal sanctions) {
		this.sanctions = sanctions;
	}

	public List<WidgetDataInfoVO> getWidgetDataInfos() {
		return widgetDataInfos;
	}

	public void setWidgetDataInfos(List<WidgetDataInfoVO> widgetDataInfos) {
		this.widgetDataInfos = widgetDataInfos;
	}

	public JSONArray toJSONArray(){

		JSONArray jsArray = new JSONArray();
		for (WidgetDataInfoVO widgetDataInfo:  widgetDataInfos) {
			jsArray.put(widgetDataInfo);
		}
		return jsArray;
	}

}
