package com.lyx.silversea.dao.system;

import com.lyx.silversea.domain.system.User;

import java.util.Map;

public interface UserDao {

    /**
     * 登录
     * @param map
     * @return
     */
    User userLoginInfo(Map<String, String> map);

    int insert(User record);

    int insertSelective(User record);
}