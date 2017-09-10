package com.tangguoxiang.service;

import com.tangguoxiang.dao.EmployeeMapper;
import com.tangguoxiang.domain.Employee;
import com.tangguoxiang.domain.EmployeeExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.validation.Valid;
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
     * @return List<Employee>
     */
    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }

    /**
     * 保存员工信息方法
     * @param employee 员工对象
     */
    public void save(@Valid Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    /**
     * ajax 校验员工名是否存在方法
     * @param empName 员工名
     * @return true 表示不存在  false表示存在
     */
    public boolean checkName(String empName) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(employeeExample);
        return count==0 ;
    }

    /**
     * 根据id查询员工
     * @param id 主键id
     * @return Employee
     */
    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }
}
