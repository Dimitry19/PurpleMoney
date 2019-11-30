package cm.purplemoney.common.ent.vo;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.math.BigDecimal;

public class WidgetDataInfoVO {

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

/*	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}*/

	public String toJson(){

		String jsonStr = null;
		ObjectMapper Obj = new ObjectMapper();
		try {
			jsonStr = Obj.writeValueAsString(this);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// Displaying JSON String
		System.out.println(jsonStr);
		return jsonStr;
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
