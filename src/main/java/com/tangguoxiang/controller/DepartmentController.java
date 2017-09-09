package com.tangguoxiang.controller;

import com.tangguoxiang.domain.Department;
import com.tangguoxiang.domain.Message;
import com.tangguoxiang.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 唐国翔 on 2017/9/8.
 */
@Controller
public class DepartmentController {
    @Resource
    private DepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/depts")
    public Message getDepartments(){
        List<Department> departments = departmentService.getDepts();
        return Message.success("部门查询成功").add("depts",departments);
    }
}
