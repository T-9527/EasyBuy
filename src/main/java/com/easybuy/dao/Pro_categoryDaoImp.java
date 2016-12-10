package com.easybuy.dao;

import com.easybuy.model.Pro_category;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2016/12/7.
 */
@Repository
public class Pro_categoryDaoImp extends BaseDaoImp<Pro_category> implements IPro_categoryDao{

    public Pro_category getByName(String name) {
        return (Pro_category) getsession().createQuery("from Pro_category where name=:name")
                .setParameter("name",name).uniqueResult();
    }
}
