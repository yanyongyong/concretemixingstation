package com.zyd.shiro.business.online.controller;

import com.alibaba.fastjson.JSONObject;
import com.zyd.shiro.business.online.entity.Online;
import com.zyd.shiro.business.online.service.OnlineServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: ziv
 * @Date: 2018/8/7 19:25
 * @Description:
 */
@RestController
//@RequestMapping("/user")
public class OnlineController {

    @Autowired
    OnlineServer onlineServer;


    @RequestMapping(value = "/list")
    public Online test(){
       return onlineServer.getOne(1);
    }


    public static void json(){
        String json = "[{\"expman\":\"Admin\",\"selectgronum\":1,\"zuhao\":5691,\"grokn\":918.73,\"grompa\":40.8,\"lingqi\":7,\"pingzhong\":\"C35\",\"specialshape\":0,\"speed\":\"0.50\",\"expcop\":\"GB/T 50081-2002\",\"expdate\":\"2018-08-07\",\"gronum\":1}, {\"expman\":\"Admin\",\"selectgronum\":1,\"zuhao\":5692,\"grokn\":918.73,\"grompa\":40.8,\"lingqi\":7,\"pingzhong\":\"C35\",\"specialshape\":0,\"speed\":\"0.50\",\"expcop\":\"GB/T 50081-2002\",\"expdate\":\"2018-08-08\",\"gronum\":1}]";
        List<ExamHntkygroup> collection = JSONObject.parseArray(json, ExamHntkygroup.class);
        System.out.println(collection.get(0).getExpman());
    }

    public static void main(String[] args) {
        json();
    }
}
