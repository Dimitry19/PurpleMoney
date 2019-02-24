package cam.common.date.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static final String   pattern = "dd/MM/yyyy";

    public static String formatDate(Date date){

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        return simpleDateFormat.format(new Date());

    }

    public  static Date parseDate(String dateStr) throws ParseException {

        SimpleDateFormat format = new SimpleDateFormat(pattern);
       // String dateString = format.format( new Date()   );
        return format.parse ( dateStr );
    }

}
