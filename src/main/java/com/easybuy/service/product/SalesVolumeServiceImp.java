package com.easybuy.service.product;

import com.easybuy.dao.product.ISalesVolumeDao;
import com.easybuy.model.SalesVolume;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/12/11.
 */
@Service
public class SalesVolumeServiceImp implements ISalesVolumeService {

    private ISalesVolumeDao iSalesVolume;

    @Resource
    public void setiSalesVolume(ISalesVolumeDao iSalesVolume) {
        this.iSalesVolume = iSalesVolume;
    }

    public List getCount(String hql){
        return iSalesVolume.getCount(hql);
    }
}
