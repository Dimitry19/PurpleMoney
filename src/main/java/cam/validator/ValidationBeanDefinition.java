package cam.validator;

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower

import java.util.HashMap;
import java.util.Map;

public  class ValidationBeanDefinition {
    private Class orgin;
    private boolean onUpdate;
    private boolean onCreate;
    private boolean onDelete;
    private boolean breakOnFirstError;
    private Class postValidator;
    private Map<String, AValidationDefinition> validations = new HashMap();

    public ValidationBeanDefinition(Class origin, boolean onUpdate, boolean onCreate, boolean onDelete, boolean breakOnFirstError, Class postValidator) {
        this.orgin = origin;
        this.onUpdate = onUpdate;
        this.onCreate = onCreate;
        this.onDelete = onDelete;
        this.breakOnFirstError = breakOnFirstError;
        this.postValidator = postValidator;
    }

    public boolean isOnUpdate() {
        return this.onUpdate;
    }

    public void setOnUpdate(boolean onUpdate) {
        this.onUpdate = onUpdate;
    }

    public boolean isOnCreate() {
        return this.onCreate;
    }

    public void setOnCreate(boolean onCreate) {
        this.onCreate = onCreate;
    }

    public boolean isOnDelete() {
        return this.onDelete;
    }

    public void setOnDelete(boolean onDelete) {
        this.onDelete = onDelete;
    }

    public boolean isBreakOnFirstError() {
        return this.breakOnFirstError;
    }

    public void setBreakOnFirstError(boolean breakOnFirstError) {
        this.breakOnFirstError = breakOnFirstError;
    }

    public Class getPostValidator() {
        return this.postValidator;
    }

    public void setPostValidator(Class postValidator) {
        this.postValidator = postValidator;
    }

    public Map<String, AValidationDefinition> getValidations() {
        return this.validations;
    }

    public void setValidations(Map<String, AValidationDefinition> fieldValidations) {
        this.validations = fieldValidations;
    }

    public Class getOrgin() {
        return this.orgin;
    }

    public void setOrgin(Class orgin) {
        this.orgin = orgin;
    }
}
