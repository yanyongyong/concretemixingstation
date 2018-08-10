package com.zyd.shiro.business.mixingstation.controller;

import com.github.pagehelper.PageInfo;
import com.zyd.shiro.business.mixingstation.entity.ProductionRecords;
import com.zyd.shiro.business.mixingstation.server.MixingStationServer;
import com.zyd.shiro.business.mixingstation.vo.MixingStationConditionVO;
import com.zyd.shiro.framework.object.PageResult;
import com.zyd.shiro.util.ResultUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: ziv
 * @Date: 2018/8/7 19:25
 * @Description:
 */
@RestController
@RequestMapping("/mixingstation")
public class MixingStationController {

    @Autowired
    MixingStationServer mixingStationServer;

    @RequiresPermissions("mixingstations")
    @RequestMapping(value = "/list")
    public PageResult list(MixingStationConditionVO vo){
        PageInfo<ProductionRecords> pageInfo = mixingStationServer.findPageBreakByCondition(vo);
        return ResultUtil.tablePage(pageInfo);
    }

}
