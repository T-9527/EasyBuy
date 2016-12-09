package com.easybuy.service;

import com.easybuy.dao.IParent_categoryDao;
import com.easybuy.model.Parent_category;
import com.easybuy.util.Pager;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/8.
 */
@Service
public class Parent_categoryServiceImp implements IParent_categoryService {

    private IParent_categoryDao iParent_categoryDao;
    public void add(Parent_category t) {
        iParent_categoryDao.add(t);
    }

    public void update(Parent_category t) {
        iParent_categoryDao.update(t);
    }

    public void delete(int id) {
        iParent_categoryDao.delete(id);
    }

    public Parent_category load(int id) {
        return iParent_categoryDao.load(id);
    }

    public List<Parent_category> list(String hql) {
        return iParent_categoryDao.list(hql);
    }

    public List<Parent_category> list(String hql, Object[] obj) {
        return iParent_categoryDao.list(hql,obj);
    }

    public Pager<Parent_category> pageList(String hql, Object[] obj) {
        return iParent_categoryDao.pageList(hql,obj);
    }

   @Resource
    public void setiParent_categoryDao(IParent_categoryDao iParent_categoryDao) {
        this.iParent_categoryDao = iParent_categoryDao;
    }
}
