package com.shiliu.movie.bussiness.validator;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.HashMap;
import java.util.Set;

@Component
public class ValidatorService implements InitializingBean {
    private Validator validator;

    /**
     * 实现校验方法并返回校验结果
     *
     * @param bean
     * @return
     */
    public ValidationResult validate(Object bean) {
        ValidationResult result = new ValidationResult();
        result.setErrorMsgMap(new HashMap<>());
        Set<ConstraintViolation<Object>> constraintViolationSet = this.validator.validate(bean);
        if (constraintViolationSet.size() > 0) {
            // 有错误
            result.setHasErrors(true);
            constraintViolationSet.forEach(e -> {
                String errMsg = e.getMessage();
                String propertyName = e.getPropertyPath().toString();
                result.getErrorMsgMap().put(propertyName, errMsg);
            });
        }
        return result;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        // 将hibernate validator通过工厂的初始化方式使其实例化
        this.validator = Validation.buildDefaultValidatorFactory().getValidator();
    }
}
