package com.zyd.shiro.business.project.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Transient;
import java.util.List;

/**
 * @Author: ziv
 * @Date: 2018/8/13 15:01
 * @Description:
 */

@Data
@ApiModel(description="项目以及标段相关信息")
public class Project {

    private Integer id;

    private String name;

    @ApiModelProperty("父类ID")
    private Integer parentId;

    @Transient
    private Integer checked;
    @Transient
    private List<Project> nodes;

}
