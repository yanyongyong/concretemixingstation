package com.zyd.shiro.business.mixingstation.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Author: ziv
 * @Date: 2018/5/21 14:50
 * @Description:
 */
@Data
@ApiModel(description="主表")
public class ProductionRecords {


    private Integer id;

    @ApiModelProperty(value="项目名",name="projectName")
    private String projectName;

    @ApiModelProperty(value="标段",name="tenders")
    private String tenders;

    @ApiModelProperty(value="生产线编号",name="lineNumber")
    private String lineNumber;

    @ApiModelProperty(value="设计强度",name="designStrength")
    private String designStrength;

    @ApiModelProperty(value="施工部位",name="constructionSite")
    private String constructionSite;

    @ApiModelProperty(value="生产方量",name="productionVolume")
    private String productionVolume;

    private List<ProductionDetail> prodectionDetails;


}
