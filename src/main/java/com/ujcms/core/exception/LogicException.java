package com.ujcms.core.exception;

import org.springframework.lang.Nullable;

/**
 * @author PONY
 */
public class LogicException extends MessagedException {
    public LogicException(String code, @Nullable String... args) {
        super(code, args);
    }
}
