package com.zyd.shiro.business.project.entity;

import io.swagger.annotations.ApiModel;
import lombok.Data;

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

    private Integer parentId;

    private Integer checked;

}
