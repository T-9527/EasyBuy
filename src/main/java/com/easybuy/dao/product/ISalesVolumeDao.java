package com.easybuy.dao.product;

import com.easybuy.dao.IBaseDao;
import com.easybuy.model.SalesVolume;

import java.util.List;

/**
 * Created by Administrator on 2016/12/11.
 */
public interface ISalesVolumeDao extends IBaseDao<SalesVolume> {
    List getCount(String hql);
}
