package com.easybuy.dao;

import com.easybuy.model.Parent_category;

import org.springframework.stereotype.Repository;


/**
 * Created by Administrator on 2016/12/8.
 */
@Repository
public class Parent_categoryDaoImp extends BaseDaoImp<Parent_category> implements IParent_categoryDao {
    public Parent_category getByName(String name) {
        return (Parent_category) getsession().createQuery("from Parent_category where name=:name")
                .setParameter("name",name).uniqueResult();
    }
}
