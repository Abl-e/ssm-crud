package com.tangguoxiang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tangguoxiang.domain.Employee;
import com.tangguoxiang.domain.Message;
import com.tangguoxiang.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐国翔 on 2017/9/7 0007.
 * 处理员工的CRUD
 */
@Controller
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;

    @RequestMapping("/emps")
    @ResponseBody
    public  Message getPageInfoForJson(@RequestParam(value = "page",defaultValue = "1")Integer page){
        //在查询之前调用，传入页码，以及每页的条数
        PageHelper.startPage(page,5);
        //startPage后紧跟的查询就是一个分页查询
        List<Employee> employees = employeeService.getAll();
        //使用pageInfo包装分页结果，只需要将pageInfo交给页面就行
        //封装的详细的得分也信息，包括查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(employees,5);
        return Message.success("分页查询成功").add("pageInfo",pageInfo);
    }

    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "page",defaultValue = "1")Integer page,
                          Map<String,Object> map){

        //在查询之前调用，传入页码，以及每页的条数
        PageHelper.startPage(page,5);
        //startPage后紧跟的查询就是一个分页查询
        List<Employee> employees = employeeService.getAll();
        //使用pageInfo包装分页结果，只需要将pageInfo交给页面就行
        //封装的详细的得分也信息，包括查询出来的数据,传入连续显示的页数
        PageInfo pageInfo = new PageInfo(employees,5);
        map.put("pageInfo",pageInfo);
        return "list";
    }
}
