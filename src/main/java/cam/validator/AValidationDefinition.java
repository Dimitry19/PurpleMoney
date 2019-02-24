package cam.validator;

import cam.validator.util.ValidatorUtil;
import java.lang.reflect.Method;

public abstract class AValidationDefinition {
    protected String id;
    protected ValidationBeanDefinition validateDefinition;
    protected String prefixKey;
    protected String errorKey;
    protected Method getter;
    protected String validationName;
    protected int wizardStep;

    public AValidationDefinition(ValidationBeanDefinition validateDefinition, String id, Method getter, String validationName) {
        this.id = id;
        this.validateDefinition = validateDefinition;
        this.getter = getter;
        this.validationName = validationName;
        this.composeErrorKey();
    }

    public Method getGetter() {
        return this.getter;
    }

    public void setGetter(Method getter) {
        this.getter = getter;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPrefixKey() {
        return this.prefixKey;
    }

    public void setPrefixKey(String prefixKey) {
        this.prefixKey = prefixKey;
        this.composeErrorKey();
    }

    public String getValidationName() {
        return this.validationName;
    }

    public void setValidationName(String validationName) {
        this.validationName = validationName;
        this.composeErrorKey();
    }

    public String getErrorKey() {
        return this.errorKey;
    }

    public void setErrorKey(String errorKey) {
        this.errorKey = errorKey;
        this.composeErrorKey();
    }

    void composeErrorKey() {
        this.errorKey = ValidatorUtil.composeErrorKey(this.prefixKey, new String[]{this.validationName});
    }

    public ValidationBeanDefinition getValidateDefinition() {
        return this.validateDefinition;
    }

    public void setValidateDefinition(ValidationBeanDefinition validateDefinition) {
        this.validateDefinition = validateDefinition;
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(this.getClass().getName());
        builder.append(" {\n\t{id:");
        builder.append(this.id);
        builder.append("},\n\t{validateDefinition:");
        builder.append(this.validateDefinition);
        builder.append("},\n\t{prefixKey:");
        builder.append(this.prefixKey);
        builder.append("},\n\t{getter:");
        builder.append(this.getter);
        builder.append("},\n\t{validationName:");
        builder.append(this.validationName);
        builder.append("},\n\t{errorKey:");
        builder.append(this.errorKey);
        builder.append("}\n}");
        return builder.toString();
    }

    public int getWizardStep() {
        return this.wizardStep;
    }

    public void setWizardStep(int wizardStep) {
        this.wizardStep = wizardStep;
    }
}
