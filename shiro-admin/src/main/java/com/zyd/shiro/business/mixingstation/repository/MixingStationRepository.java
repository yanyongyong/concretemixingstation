package com.zyd.shiro.business.mixingstation.repository;


import com.zyd.shiro.business.mixingstation.entity.ProductionRecords;
import com.zyd.shiro.business.mixingstation.vo.MixingStationConditionVO;
import com.zyd.shiro.business.online.entity.Online;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: ziv
 * @Date: 2018/8/8 15:16
 * @Description:
 */
@Repository
public interface MixingStationRepository {

    @Select("SELECT * FROM com_online WHERE id = #{id}")
    Online getOne(int id);

    @Select("SELECT * FROM mix_ProductionRecords")
    List<ProductionRecords> findPageBreakByCondition(MixingStationConditionVO vo);

}
