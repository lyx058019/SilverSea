package com.lyx.silversea.domain.system;

import java.io.Serializable;
import lombok.Data;

/**
 * Table: user
 */
@Data
public class User implements Serializable {
    /**
     * userid
     *
     * Table:     user
     * Column:    userid
     * Nullable:  false
     */
    private String userid;

    /**
     * 登录名称
     *
     * Table:     user
     * Column:    loginname
     * Nullable:  false
     */
    private String loginname;

    /**
     * 密码
     *
     * Table:     user
     * Column:    password
     * Nullable:  false
     */
    private String password;

    /**
     * 用户姓名
     *
     * Table:     user
     * Column:    username
     * Nullable:  true
     */
    private String username;

    /**
     * 用户电话
     *
     * Table:     user
     * Column:    usertel
     * Nullable:  true
     */
    private String usertel;

    /**
     * 用户备注
     *
     * Table:     user
     * Column:    comment
     * Nullable:  true
     */
    private String comment;

    private static final long serialVersionUID = 1L;
}