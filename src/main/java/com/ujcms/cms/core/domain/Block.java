package com.ujcms.cms.core.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ujcms.cms.core.domain.base.BlockBase;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Objects;

import static com.ujcms.cms.core.domain.support.EntityConstants.SCOPE_GLOBAL;

/**
 * 区块 实体类
 *
 * @author PONY
 */
public class Block extends BlockBase implements Serializable {
    /**
     * 是否全局共享
     */
    @JsonIgnore
    public boolean isGlobal() {
        return getScope() == SCOPE_GLOBAL;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Block bean = (Block) o;
        return Objects.equals(getId(), bean.getId());
    }

    @Override
    @Length(max = 50)
    @NotNull
    @Pattern(regexp = "^[u4E00-u9FA5\\w-]*$")
    public String getAlias() {
        return super.getAlias();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }
}