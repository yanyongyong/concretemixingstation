package com.zyd.shiro.business.project.repository;

import com.zyd.shiro.business.project.entity.Project;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: ziv
 * @Date: 2018/8/14 09:37
 * @Description:
 */
@Repository
public interface ProjectRepository {

    @Select("SELECT * FROM com_project")
    List<Project> findAll();


}
