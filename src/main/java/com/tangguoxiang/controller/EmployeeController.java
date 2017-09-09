package com.tangguoxiang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tangguoxiang.domain.Employee;
import com.tangguoxiang.domain.Message;
import com.tangguoxiang.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.HashMap;
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

    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Message empSave(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            List<FieldError> errors = result.getFieldErrors();
            Map<String,Object> map = new HashMap<>();
            for(FieldError e:errors){
                map.put(e.getField(),e.getDefaultMessage());
            }
            return Message.fail("").add("error",map);
        }else{
            employeeService.save(employee);
            return Message.success("员工信息保存成功");
        }

    }

    @RequestMapping(value = "/checkEmpName")
    @ResponseBody
    public Message checkEnpName(@RequestParam(value = "empName")String empName){
        String regName = "(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,6})";
        if(!empName.matches(regName)){
            return Message.fail("用户名必须为6-16数字字母或者2-6中文汉字");
        }
        boolean b = employeeService.checkName(empName);
        if(b){
            return Message.success("用户名可用");
        }else {
            return Message.fail("用户已存在");
        }
    }

    /**
     *
     * @param page 页码
     * @return Message 封装数据信息
     */
    @RequestMapping("/emps")
    @ResponseBody
    public  Message getPageInfoForJson(@RequestParam(value = "page",defaultValue = "1")Integer page){
        //在查询之前调用，传入页码，以及每页的条数
        PageHelper.startPage(page,5);
        //startPage后紧跟的查询就是一个分页查询
        List<Employee> employees = employeeService.getAll();
        //使用pageInfo包装分页结果，只需要将pageInfo交给页面就行
        //封装的详细的得分也信息，包括查询出来的数据,传入连续显示的页数
        PageInfo<Employee> pageInfo = new PageInfo<>(employees,10);
        return Message.success("分页查询成功").add("pageInfo",pageInfo);
    }

    //@RequestMapping("/emps") 回调页面方式
    /*public String getEmps(@RequestParam(value = "page",defaultValue = "1")Integer page,
                          Map<String,Object> map){

        //在查询之前调用，传入页码，以及每页的条数
        PageHelper.startPage(page,5);
        //startPage后紧跟的查询就是一个分页查询
        List<Employee> employees = employeeService.getAll();
        //使用pageInfo包装分页结果，只需要将pageInfo交给页面就行
        //封装的详细的得分也信息，包括查询出来的数据,传入连续显示的页数
        PageInfo<Employee> pageInfo = new PageInfo<>(employees,10);
        map.put("pageInfo",pageInfo);
        return "list";
    }*/
}
