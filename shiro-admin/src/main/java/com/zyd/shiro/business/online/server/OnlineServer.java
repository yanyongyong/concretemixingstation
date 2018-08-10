package com.zyd.shiro.business.online.server;

import com.zyd.shiro.business.online.entity.Online;
import com.zyd.shiro.business.online.repository.OnlineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: ziv
 * @Date: 2018/8/8 15:21
 * @Description:
 */
@Service
public class OnlineServer{

    @Autowired
    OnlineRepository onlineRepository;

    public Online getOne(int id) {
        return onlineRepository.getOne(id);
    }


}
