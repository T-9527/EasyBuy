package com.easybuy.service;

import com.easybuy.dao.IPro_categoryDao;
import com.easybuy.dao.IProductDao;
import com.easybuy.model.Pro_category;
import com.easybuy.model.Product;
import com.easybuy.util.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/7.
 */
@Service
public class ProductServiceImp implements IProductService {

    private IProductDao iProductDao;
    private IPro_categoryDao iPro_categoryDao;


    public IProductDao getiProductDao() {
        return iProductDao;
    }
   @Resource
    public void setiProductDao(IProductDao iProductDao) {
        this.iProductDao = iProductDao;
    }

    public void add(Product t) {
        Pro_category p =iPro_categoryDao.getByName(t.getPro_category().getName());
        t.setPro_category(p);
        iProductDao.add(t);
    }

    public void update(Product t) {
        Pro_category p =iPro_categoryDao.getByName(t.getPro_category().getName());
        t.setPro_category(p);
        iProductDao.update(t);
    }

    public void delete(int id) {
        iProductDao.delete(id);
    }

    public Product load(int id) {
        return iProductDao.load(id);
    }

    public List<Product> list(String hql) {
        return iProductDao.list(hql);
    }

    public List<Product> list(String hql, Object[] obj) {
        return iProductDao.list(hql,obj);
    }

    public Pager<Product> pageList(String hql, Object[] obj) {
        return iProductDao.pageList(hql,obj);
    }

    @Resource
    public void setiPro_categoryDao(IPro_categoryDao iPro_categoryDao) {
        this.iPro_categoryDao = iPro_categoryDao;
    }
}
