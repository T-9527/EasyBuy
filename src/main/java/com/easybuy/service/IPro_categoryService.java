package com.easybuy.service;

import com.easybuy.model.Pro_category;
import com.easybuy.model.Product;
import com.easybuy.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2016/12/7.
 */
public interface IPro_categoryService {
    void add(Pro_category t);
    void update(Pro_category t);
    void delete(int id);
    //    查询单个对象
    Pro_category load(int id);
    //    查询列表
    List<Pro_category> list(String hql);
    //    带参数的查询
    List<Pro_category> list(String hql, Object[] obj);

    Pager<Pro_category> pageList(String hql, Object[] obj);
}
