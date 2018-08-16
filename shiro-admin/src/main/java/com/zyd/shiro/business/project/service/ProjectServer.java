package com.zyd.shiro.business.project.service;

import com.zyd.shiro.business.project.entity.Project;
import com.zyd.shiro.business.project.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: ziv
 * @Date: 2018/8/14 09:40
 * @Description:
 */
@Service
public class ProjectServer {

    @Autowired
    ProjectRepository projectRepository;

    /**
     *封装ztree需要的数据
     */
    public List<Map<String, Object>> findAll(){
        List<Project> projects = projectRepository.findAll();
        if (CollectionUtils.isEmpty(projects)) {
            return null;
        }
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = null;
        for (Project resources : projects) {
            map = new HashMap<String, Object>(3);
            map.put("id", resources.getId());
            map.put("pId", resources.getParentId());
            map.put("checked", "false");
            map.put("name", resources.getName());
            mapList.add(map);
        }
        return mapList;
    }

    public void add(Project project){
         projectRepository.add(project.getName(),project.getParentId());
    }

    public void delete(Integer id){
        projectRepository.delete(id);
    }

    public void edit(Project project){
        projectRepository.edit(project.getName(),project.getId());
    }

}
