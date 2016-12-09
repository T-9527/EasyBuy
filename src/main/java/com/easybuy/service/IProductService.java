package com.easybuy.service;

import com.easybuy.model.Product;
import com.easybuy.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2016/12/7.
 */
public interface IProductService {
    void add(Product t);
    void update(Product t);
    void delete(int id);
    //    查询单个对象
    Product load(int id);
    //    查询列表
    List<Product> list(String hql);
    //    带参数的查询
    List<Product> list(String hql, Object[] obj);

    Pager<Product> pageList(String hql, Object[] obj);
}
