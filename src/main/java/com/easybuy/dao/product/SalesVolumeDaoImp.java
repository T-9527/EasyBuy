package com.easybuy.dao.product;

import com.easybuy.dao.BaseDaoImp;
import com.easybuy.model.SalesVolume;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/12/11.
 */
@Repository
public class SalesVolumeDaoImp extends BaseDaoImp<SalesVolume> implements ISalesVolumeDao {
    public List getCount(String hql) {
        return this.getSessionFactory().getCurrentSession().createQuery(hql).list();
    }
}
