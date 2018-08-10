package com.zyd.shiro.business.mixingstation.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(description="生产记录明细:材料用量")
public class MaterialVolume{

    private Integer id;

    @ApiModelProperty(value="生产详情ID",name="productionDetailId")
    private Integer productionDetailId;

    @ApiModelProperty(value="材料名称",name="materialName")
    private String materialName;

    @ApiModelProperty(value="实际用量",name="realAmount")
    private Double realAmount;

    @ApiModelProperty(value="计量用量",name="estimateAmount")
    private Double estimateAmount;

    @ApiModelProperty(value="误差&",name="mistake")
    private Double mistake;

}
