package com.easybuy.dao;

import com.easybuy.model.Parent_category;

/**
 * Created by Administrator on 2016/12/8.
 */
public interface IParent_categoryDao extends IBaseDao<Parent_category>{
    public Parent_category getByName(String name);
}
