package com.shiliu.movie.bussiness.validator;

import org.apache.commons.lang.StringUtils;

import java.util.Map;

public class ValidationResult {
    private boolean hasErrors;

    private Map<String, String> errorMsgMap;

    public boolean isHasErrors() {
        return hasErrors;
    }

    public void setHasErrors(boolean hasErrors) {
        this.hasErrors = hasErrors;
    }

    public Map<String, String> getErrorMsgMap() {
        return errorMsgMap;
    }

    public void setErrorMsgMap(Map<String, String> errorMsgMap) {
        this.errorMsgMap = errorMsgMap;
    }

    public String getErrorMsg() {
        return StringUtils.join(errorMsgMap.values(), ",");
    }
}
