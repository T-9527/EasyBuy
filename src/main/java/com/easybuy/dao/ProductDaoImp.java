package com.easybuy.dao;

import com.easybuy.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/7.
 */
@Repository
public class ProductDaoImp extends BaseDao<Product> implements IProductDao {

}
