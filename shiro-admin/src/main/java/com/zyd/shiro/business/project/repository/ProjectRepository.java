package com.zyd.shiro.business.project.repository;

import com.zyd.shiro.business.project.entity.Project;
import org.apache.ibatis.annotations.*;
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

    @Insert("insert into com_project(name,parentId) values(#{name},#{parentId})")
    void add(@Param("name") String name, @Param("parentId")Integer parentId);

    @Delete("delete from com_project where id = #{id}")
    void delete(@Param("id")Integer id);

    @Update("update com_project set name = #{name} where id = #{id}")
    void edit(@Param("name") String name, @Param("id")Integer id);
}
