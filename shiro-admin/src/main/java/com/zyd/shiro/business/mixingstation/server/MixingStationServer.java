package com.zyd.shiro.business.mixingstation.server;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyd.shiro.business.mixingstation.entity.ProductionDetail;
import com.zyd.shiro.business.mixingstation.entity.ProductionRecords;
import com.zyd.shiro.business.mixingstation.repository.MixingStationRepository;
import com.zyd.shiro.business.mixingstation.vo.MixingStationConditionVO;
import com.zyd.shiro.business.mixingstation.vo.MixingStationDetailConditionVO;
import com.zyd.shiro.business.online.entity.Online;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: ziv
 * @Date: 2018/8/8 15:21
 * @Description:
 */
@Service
public class MixingStationServer{

    @Autowired
    MixingStationRepository mixingStationRepository;

    public PageInfo<ProductionRecords> findPageBreakByCondition(MixingStationConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<ProductionRecords> productionRecords = mixingStationRepository.findPageBreakByCondition(vo);
        if (CollectionUtils.isEmpty(productionRecords)) {
            return null;
        }
        PageInfo bean = new PageInfo<ProductionRecords>(productionRecords);
        return bean;
    }

    public Online getOne(int id) {
        return mixingStationRepository.getOne(id);
    }

    public PageInfo<ProductionDetail> findPageProductionDetail(MixingStationDetailConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        if (vo.getProductionDetail()==null){
            return null;
        }
        List<ProductionDetail> productionDetails = mixingStationRepository.findPageProductionDetail(vo.getProductionDetail().getMixProductionRecordsId());
        if (CollectionUtils.isEmpty(productionDetails)) {
            return null;
        }
        PageInfo bean = new PageInfo<ProductionDetail>(productionDetails);
        return bean;
    }

}
