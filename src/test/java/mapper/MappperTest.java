package mapper;

import com.tangguoxiang.dao.DepartmentMapper;
import com.tangguoxiang.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by 唐国翔 on 2017/9/7 0007.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MappperTest {

    @Resource
    private DepartmentMapper departmentMapper;
    @Resource
    private EmployeeMapper employeeMapper;
    @Resource
    private SqlSession sqlSession;
    /**
     * 测试DepartmentMapper
     */
    @Test
    public void testCRUD(){
        /*System.out.println(departmentMapper);
        departmentMapper.insertSelective(new Department(null,"开发部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));*/

        //employeeMapper.insertSelective(new Employee(null,"jerry","M","jerry@qq.com",1));

        //批量操作sqlSession
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        System.out.println(sqlSession.getConfiguration());
       /* for (int i = 0; i < 1000; i++) {
            String uuid = UUID.randomUUID().toString().substring(0,5)+i;
            mapper.insertSelective(new Employee(null,uuid,"M",uuid+"@qq.com",1));
        }*/

    }
}
