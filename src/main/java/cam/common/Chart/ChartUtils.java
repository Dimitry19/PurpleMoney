package cam.common.Chart;

import be.ceau.chart.BarChart;
import be.ceau.chart.color.Color;
import be.ceau.chart.data.BarData;
import be.ceau.chart.dataset.BarDataset;

public class ChartUtils {


	public static String  BarDataset(String chartLabel){
		BarDataset dataset = new BarDataset()
				.setLabel("sample chart")
				.setData(65, 59, 80, 81, 56, 55, 40)
				.addBackgroundColors(Color.RED, Color.GREEN, Color.BLUE, Color.YELLOW, Color.ORANGE, Color.GRAY, Color.BLACK)
				.setBorderWidth(2);

		BarData data = new BarData()
				.addLabels("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
				.addDataset(dataset);

		return new BarChart(data).toJson();
	}
}
