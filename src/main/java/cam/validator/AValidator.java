package cam.validator;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.InvocationTargetException;
import java.util.Stack;

public abstract class AValidator {
    private static final Logger log = LoggerFactory.getLogger(AValidator.class);
    private Class subjectOfValidationClass;
    private Stack<String> path = new Stack();

    public AValidator() {
    }

    protected Object extractValue(AValidationDefinition validateDefinition, Object entity) throws InvocationTargetException, IllegalAccessException {
        return validateDefinition.getGetter().invoke(entity);
    }

    public void addToken(String token) {
        StringBuilder sb = new StringBuilder();
        if (!this.path.isEmpty()) {
            sb.append((String)this.path.peek()).append(".");
        }

        sb.append(token);
        if (log.isDebugEnabled()) {
            log.debug("Memorizzo in path il percorso:{}", sb);
        }

        this.path.push(sb.toString());
    }

    public void removeToken() {
        if (!this.path.isEmpty()) {
            String step = (String)this.path.pop();
            if (log.isDebugEnabled()) {
                log.debug("Rimosso il percorso:{}", step);
            }
        }

    }

    public String getCurrentToken() {
        if (!this.path.isEmpty()) {
            String token = (String)this.path.peek();
            if (log.isDebugEnabled()) {
                log.debug("Recupero il percorso:{}", token);
            }

            return token;
        } else {
            return null;
        }
    }

    public Class getSubjectOfValidationClass() {
        return this.subjectOfValidationClass;
    }

    public void setSubjectOfValidationClass(Class subjectOfValidationClass) {
        this.subjectOfValidationClass = subjectOfValidationClass;
    }
}
