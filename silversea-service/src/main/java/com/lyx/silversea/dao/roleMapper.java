package com.lyx.silversea.dao;

import com.lyx.silversea.model.role;

public interface roleMapper {
    int deleteByPrimaryKey(String roleid);

    int insert(role record);

    int insertSelective(role record);

    role selectByPrimaryKey(String roleid);

    int updateByPrimaryKeySelective(role record);

    int updateByPrimaryKey(role record);
}