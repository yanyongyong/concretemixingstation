package com.zyd.shiro.business.online.entity;

import lombok.Data;

/**
 * @Author: ziv
 * @Date: 2018/8/8 15:02
 * @Description:
 */
@Data
public class Online {

    private String id;

    private String project;

    private String Section;

    private String serverIP;

    private String isonline;

    private Data lastOnlineTime;

    private String remark;
}
