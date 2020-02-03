package cm.purplemoney.common.ent.vo;

import be.ceau.chart.BarChart;
import be.ceau.chart.color.Color;
import be.ceau.chart.data.BarData;
import be.ceau.chart.dataset.BarDataset;
import cm.purplemoney.loan.ent.vo.LoanVO;
import cm.purplemoney.loan.wrapper.Loan;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class WidgetVO implements Serializable {

	private BigDecimal commonFound;
	private BigDecimal personalFound;
	private Loan loan;
	private BigDecimal sanctions;
	private List<WidgetLoanInfoChartVO> widgetLoanInfosChart;

	private WidgetFrequenceInfoChartVO widgetFrequenceInfosChart;

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

	public List<WidgetLoanInfoChartVO> getWidgetLoanInfosChart() {
		return widgetLoanInfosChart;
	}

	public void setWidgetLoanInfosChart(List<WidgetLoanInfoChartVO> widgetLoanInfosChart) {
		this.widgetLoanInfosChart = widgetLoanInfosChart;
	}

	public WidgetFrequenceInfoChartVO getWidgetFrequenceInfosChart() {
		return widgetFrequenceInfosChart;
	}

	public void setWidgetFrequenceInfosChart(WidgetFrequenceInfoChartVO widgetFrequenceInfosChart) {
		this.widgetFrequenceInfosChart = widgetFrequenceInfosChart;
	}

	public String retrieveWidgetLoanInfosChart(){
		String[] jArray= new String[12];
		for (int i=0;i<jArray.length;i++){
			jArray[i]="0";
			for (WidgetLoanInfoChartVO widgetDataInfo:  widgetLoanInfosChart) {
				if(i==widgetDataInfo.getMonth()-1){
					jArray[i]=widgetDataInfo.getAmount().toString();
				}
			}
		}

		return convertToString(jArray);
	}

	public String retrieveWidgetFrequenceInfosChart(){
		String[] jArray= new String[3];
		jArray[0]=getWidgetFrequenceInfosChart().getAbsence().toString();
		jArray[1]=getWidgetFrequenceInfosChart().getPresence().toString();
		jArray[2]=getWidgetFrequenceInfosChart().getRest().toString();

		return convertToString(jArray);
	}
	private String convertToString(String[] jArray){
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<jArray.length;i++){
			sb.append(jArray[i]+",");
		}
		return sb.toString();
	}
}
