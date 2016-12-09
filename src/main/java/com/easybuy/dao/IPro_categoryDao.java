package com.easybuy.dao;

import com.easybuy.model.Pro_category;
import com.easybuy.model.Product;

import java.util.List;

/**
 * Created by Administrator on 2016/12/7.
 */
public interface IPro_categoryDao extends IBaseDao<Pro_category>{
    public Pro_category getByName(String name);
}
