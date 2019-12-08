package cm.purplemoney.common.ent.vo;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.math.BigDecimal;

public class WidgetLoanInfoChartVO {

	private BigDecimal amount;
	private int month;
	//private int year;



	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	@Override
	public String toString()
	{
		return
				 "amount:"
				+   amount
				+ ", month:"
				+   month;
	}
}
