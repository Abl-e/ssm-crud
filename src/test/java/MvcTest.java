import com.github.pagehelper.PageInfo;
import com.tangguoxiang.domain.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 唐国翔 on 2017/9/7 0007.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springMVC.xml"})
public class MvcTest {

    @Resource
    private WebApplicationContext context;

    //虚拟mvc请求，获取到处理结果
    private MockMvc mockMvc;

    @Before
    public void initMokcMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求获得返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("page", "5")).andReturn();

        //请求成功后，请求域中会有pageInfo
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码"+pageInfo.getPageNum());
        System.out.println("总页码"+pageInfo.getPages());
        System.out.println("总记录数"+pageInfo.getTotal());
        int[] navigatepageNums = pageInfo.getNavigatepageNums();
        for (int i:navigatepageNums) {
            System.out.println(" "+i);
        }
        System.out.println();
        List<Employee> list = pageInfo.getList();
        System.out.println(list.size());
        for (Employee e:list) {
            System.out.println("ID:"+e.getEmpId()+"===>Name:"+e.getEmpName());
        }
    }
}
