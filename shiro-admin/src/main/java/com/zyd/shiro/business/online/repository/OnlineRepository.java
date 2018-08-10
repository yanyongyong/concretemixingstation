package com.zyd.shiro.business.online.repository;


import com.zyd.shiro.business.online.entity.Online;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @Author: ziv
 * @Date: 2018/8/8 15:16
 * @Description:
 */
@Repository
public interface OnlineRepository{

    @Select("SELECT * FROM com_online WHERE id = #{id}")
    Online getOne(int id);

}
