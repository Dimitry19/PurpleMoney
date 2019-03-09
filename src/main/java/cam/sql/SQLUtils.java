package cam.sql;


import org.apache.commons.lang3.StringUtils;

public class SQLUtils {
    private static final String ANY_CHARS = "%";

    public SQLUtils() {
    }

    public static String forLike(String search, boolean before, boolean after, boolean forCaseInsensitive) {
        if (StringUtils.isEmpty(search)) {
            return "%";
        } else {
            StringBuilder sb = new StringBuilder();
            if (before) {
                sb.append("%");
            }

            sb.append(forCaseInsensitive ? search.toUpperCase() : search);
            if (after) {
                sb.append("%");
            }

            return sb.toString();
        }
    }
}
