package cam.validator.util;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;

public final class ValidatorUtil {
    private static final String DOT = ".";

    private ValidatorUtil() {
    }

    public static final String composeErrorKey(String prefix, String... errorKeys) {
        StringBuilder sb = new StringBuilder(StringUtils.isNotEmpty(prefix) ? prefix : "");
        if (ArrayUtils.isNotEmpty(errorKeys)) {
            String[] var3 = errorKeys;
            int var4 = errorKeys.length;

            for(int var5 = 0; var5 < var4; ++var5) {
                String erKey = var3[var5];
                if (sb.length() != 0) {
                    sb.append(".");
                }

                sb.append(erKey.toLowerCase());
            }
        }

        return sb.toString();
    }

    public static final String composeErrorKey(Class prefixClass, String... errorKeys) {
        return composeErrorKey(prefixClass != null ? prefixClass.getName() : null, errorKeys);
    }
}
