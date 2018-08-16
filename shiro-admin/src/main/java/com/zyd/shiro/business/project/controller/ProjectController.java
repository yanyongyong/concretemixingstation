package com.zyd.shiro.business.project.controller;

import com.zyd.shiro.business.project.entity.Project;
import com.zyd.shiro.business.project.server.ProjectServer;
import com.zyd.shiro.framework.object.ResponseVO;
import com.zyd.shiro.util.ResultUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: ziv
 * @Date: 2018/8/14 09:45
 * @Description:
 */
@RestController
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    ProjectServer projectServer;

    @RequiresPermissions("project")
    @PostMapping("/tree")
    public ResponseVO showAllProject() {
        return ResultUtil.success(null, projectServer.findAll());
    }

    @GetMapping("/add")
    public ResponseVO add(Project project){
        try {
            projectServer.add(project);
        }catch (Exception e){
            e.printStackTrace();
            return ResultUtil.error("error");
        }
        return ResultUtil.success("成功");
    }

}
