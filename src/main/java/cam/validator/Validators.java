package cam.validator;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;



@Validations(requiredStrings = {
        @RequiredStringValidator(fieldName = "user", type = ValidatorType.FIELD, message = "Username is required"),
        @RequiredStringValidator(fieldName = "password", type = ValidatorType.FIELD, message = "Password is required"),
        @RequiredStringValidator(fieldName = "favourite", type = ValidatorType.FIELD, message = "Choose your Favourite Color"),
        @RequiredStringValidator(fieldName = "biograhy", type = ValidatorType.FIELD, message = "Biography is required")
}, expressions = {
        @ExpressionValidator(expression = "password.trim().length() > 5", message = "Password must have as minimum 6 Characters.")
}, fieldExpressions = {
        @FieldExpressionValidator(fieldName = "password", expression = "password.trim().length() > 6", message = "Password must have as minimum 6 Characters."),
        @FieldExpressionValidator(fieldName = "agree", expression = "agree == true", message = "Accept the Agreement.")
})
public class Validators extends AValidator{

    private static final Logger log = LoggerFactory.getLogger(Validators.class);

    public Validators(Class<?> validateClass) {
        super.setSubjectOfValidationClass(validateClass);
    }
}
