package com.zyd.shiro.business.mixingstation.entity;

import lombok.Data;


/**
 * @Author: ziv
 * @Date: 2018/6/19 08:32
 * @Description:
 */
@Data
public class MessageInform{

    /**公司ID*/
    private String companyId;

    /**项目ID*/
    private String projectId;

    /**标段ID*/
    private String sectionId;

    /**用户ID*/
    private String userId;

    /**名字*/
    private String name;

    /**电话号码*/
    private String phoneNumber;

    /**性别*/
    private String gender;

    /**部门*/
    private String department;

    /**职位*/
    private String position;

    private String mycompanyId;

}
