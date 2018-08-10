package com.zyd.shiro.business.mixingstation.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @Author:zhangyuanming
 * @Date: created in 15:48 2018/5/22
 * @Description:生产明细
 */
@Data
@ApiModel(description="生产记录明细")
public class ProductionDetail{

    private Integer id;

    @ApiModelProperty("生产记录表ID")
    private Integer mixProductionRecordsId;

    @ApiModelProperty("盘数")
    private Integer diskCount;

    @ApiModelProperty("生产时间")
    private Date produceTime;

    @ApiModelProperty("上传时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date uploadTime;

    @ApiModelProperty("搅拌时间  单位：待确定")
    private String stirTime;

    @ApiModelProperty(value="生产方量",name="productionVolume")
    private String productionVolume;

    private List<MaterialVolume> materialVolumes;

}
