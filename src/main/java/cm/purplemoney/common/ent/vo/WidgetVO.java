package cm.purplemoney.common.ent.vo;

import cm.purplemoney.loan.ent.vo.LoanVO;
import cm.purplemoney.loan.wrapper.Loan;
import org.json.JSONArray;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class WidgetVO implements Serializable {

	private BigDecimal commonFound;
	private BigDecimal personalFound;
	private Loan loan;
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

	public Loan getLoan() {
		return loan;
	}

	public void setLoan(Loan loan) {
		this.loan = loan;
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
