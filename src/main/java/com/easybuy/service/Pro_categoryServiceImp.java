package com.easybuy.service;

import com.easybuy.dao.IParent_categoryDao;
import com.easybuy.dao.IPro_categoryDao;
import com.easybuy.dao.IProductDao;
import com.easybuy.model.Parent_category;
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
public class Pro_categoryServiceImp implements IPro_categoryService {

    private IPro_categoryDao iPro_categoryDao;
    private IParent_categoryDao iParent_categoryDao;

    public IPro_categoryDao getiPro_categoryDao() {
        return iPro_categoryDao;
    }

    @Resource
    public void setiPro_categoryDao(IPro_categoryDao iPro_categoryDao) {
        this.iPro_categoryDao = iPro_categoryDao;
    }

    public void add(Pro_category t) {
        Parent_category p =iParent_categoryDao.getByName(t.getParent_category().getName());
        t.setParent_category(p);
        iPro_categoryDao.add(t);
    }

    public void update(Pro_category t) {
        Parent_category p = iParent_categoryDao.getByName(t.getParent_category().getName());
        t.setParent_category(p);
        iPro_categoryDao.update(t);
    }

    public void delete(int id) {
        iPro_categoryDao.delete(id);
    }

    public Pro_category load(int id) {
        return iPro_categoryDao.load(id);
    }

    public List<Pro_category> list(String hql) {
        return iPro_categoryDao.list(hql);
    }

    public List<Pro_category> list(String hql, Object[] obj) {
        return list(hql,obj);
    }

    public Pager<Pro_category> pageList(String hql, Object[] obj) {
        return iPro_categoryDao.pageList(hql,obj);
    }
    @Resource
    public void setiParent_categoryDao(IParent_categoryDao iParent_categoryDao) {
        this.iParent_categoryDao = iParent_categoryDao;
    }
}
