package com.tangguoxiang.service;

import com.tangguoxiang.dao.DepartmentMapper;
import com.tangguoxiang.domain.Department;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 唐国翔 on 2017/9/8.
 */
@Service
public class DepartmentService {
    @Resource
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts(){
        return departmentMapper.selectByExample(null);
    }
}
