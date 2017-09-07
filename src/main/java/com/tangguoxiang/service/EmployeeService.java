package com.tangguoxiang.service;

import com.tangguoxiang.dao.EmployeeMapper;
import com.tangguoxiang.domain.Employee;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 唐国翔 on 2017/9/7 0007.
 */
@Service
public class EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;

    /**
     * 查询所有员工
     * @return
     */
    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }

}
