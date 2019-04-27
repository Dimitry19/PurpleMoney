package cam.common.date.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static final String   pattern = "dd/MM/yyyy";
    public static final String patternQuery="yyyy-MM-dd";

    public static String formatDate(Date date){

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        return simpleDateFormat.format(date);

    }

    public  static Date parseDate(String dateStr) throws ParseException {

        SimpleDateFormat format = new SimpleDateFormat(pattern);
       // String dateString = format.format( new Date()   );
        return format.parse ( dateStr );
    }


    public static String formatDateForQuery(Date date){
            if(date==null){
                return "";
            }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(patternQuery);
        return simpleDateFormat.format(date);

    }

    public  static Date parseDateForQuery(String dateStr) throws ParseException {

        SimpleDateFormat format = new SimpleDateFormat(patternQuery);
        // String dateString = format.format( new Date()   );
        return format.parse ( dateStr );
    }


}
