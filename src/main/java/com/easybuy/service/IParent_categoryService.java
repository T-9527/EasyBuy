package com.easybuy.service;

import com.easybuy.model.Parent_category;
import com.easybuy.model.Pro_category;
import com.easybuy.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2016/12/8.
 */
public interface IParent_categoryService {
    void add(Parent_category t);
    void update(Parent_category t);
    void delete(int id);
    //    查询单个对象
    Parent_category load(int id);
    //    查询列表
    List<Parent_category> list(String hql);
    //    带参数的查询
    List<Parent_category> list(String hql, Object[] obj);

    Pager<Parent_category> pageList(String hql, Object[] obj);
}
