<%--
  User: 唐国翔
  Date: 2017/9/7
  Time: 21:29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("BASE_PATH",request.getContextPath());
%>
<html>
<head>
    <script src="${BASE_PATH}/static/js/jquery-3.2.1.min.js"></script>
    <link href="${BASE_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${BASE_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>员工管理</title>
</head>
<body>

<!-- 员工增加页面 -->
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="depts_add">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-danger disabled" id="emp_save">保存员工信息</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工修改页面 -->
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="depts_update">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary " id="emp_update">更新员工信息</button>
            </div>
        </div>
    </div>
</div>

<!-- 搭建页面 -->
<div class="container-fluid">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <!-- 显示分页信息 -->
    <div class="row">
        <!-- 分页文字信息 -->
        <div class="col-sm-4" id="page_info_area">

        </div>
        <!-- 分页条信息 -->
        <div class="col-sm-8" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">

    //定义总记录数
    var total ;

    /**
     * 初始化页面
     * **/
    $(function () {
        toPage(1);
    });

    /**
     * 发送ajax构建页面方法
     * **/
    function toPage(page) {
        $.ajax({
            url:"${BASE_PATH}/emps",
            data:{page:page},
            type:"get",
            success:function (data) {
                //console.log(data);
                total = data.result.pageInfo.total;//全局记录赋值
                //构建员工信息
                build_emps_table(data);
                //构建分页信息
                build_page_info(data);
                //构建分页条信息
                build_page_nav(data);
            }
        });
    }

    /**
     * 初始化员工列表
     * @param data
     */
    function build_emps_table(data) {
        $("#emps_table tbody").empty();
        var emps = data.result.pageInfo.list;
        $.each(emps,function (index,item) {
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
            var empEmailTd = $("<td></td>").append(item.email);
            var empDeptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>")
                .addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑").attr("edit-id",item.empId);
            var delBtn = $("<button></button>")
                .addClass("btn btn-danger btn-sm del_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(empDeptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        })
    }

    /**
     * 解析显示分页信息
     * @param data
     */
    function build_page_info(data) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前 "+data.result.pageInfo.pageNum+" 页，总共 " +data.result.pageInfo.pages+" 页,总共 " +data.result.pageInfo.total+" 条记录。");
    }

    /**
     * 解析显示分页条
     * @param data
     */
    function build_page_nav(data) {

        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").attr("href","#").attr("aria-label","Previous").append($("<span></span>").attr("aria-hidden","true").append("&laquo;")));
        if(data.result.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                toPage(1);
            });
            prePageLi.click(function () {
                toPage(data.result.pageInfo.pageNum-1);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        var nextPageLi = $("<li></li>").append($("<a></a>").attr("href","#").attr("aria-label","Next").append($("<span></span>").attr("aria-hidden","true").append("&raquo;")));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));

        if(data.result.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                toPage(data.result.pageInfo.pageNum+1);
            });
            lastPageLi.click(function () {
                toPage(data.result.pageInfo.pages);
            });
        }

        $.each(data.result.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(item == data.result.pageInfo.pageNum){
                numLi.addClass("active");
            }
            //显示页码增加点击事件重新发送ajax请求
            numLi.click(function () {
               toPage(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);

        navEle.appendTo("#page_nav_area");

    }

    /**
     * 显示员工添加模态框
     */
    $("#emp_add").click(function () {
        //恢复保存按钮样式
        $("#emp_save").removeClass("btn btn-primary").addClass("btn btn-danger").addClass("disabled");
        //清空表单数据
        $("#empAddModel form")[0].reset();
        $("#empName_add_input,#email_add_input").parent().removeClass("has-success has-error");
        $("#empName_add_input,#email_add_input").next().text("");
        //发送ajax请求，查出部门信息
        getDepts("#depts_add");
        $("#empAddModel").modal({
            backdrop : "static"
        });
    });

    /**
     * 获取部门信息
     */
    function getDepts(ele) {
        $.ajax({
            url:"${BASE_PATH}/depts",
            type:"get",
            success:function (data) {
                //console.log(data);
                //清空部门列表
                $("#depts_add").empty();
                $.each(data.result.depts,function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }

    /**
     * 校验员工姓名是否符合规则及是否存在
     * */
        $("#empName_add_input").change(function () {
            //恢复保存按钮样式
            //$("#emp_save").removeClass("btn btn-danger").addClass("btn btn-primary").removeClass("disabled");
            //校验员工姓名信息
            var regName = /(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,6})/;
            if(regName.test($("#empName_add_input").val())){
                checkForm("#empName_add_input","success","用户名可用");
                $.ajax({
                    url:"${BASE_PATH}/checkEmpName",
                    type:"post",
                    data:{empName:$("#empName_add_input").val()},
                    success:function (data) {
                        console.log(data);
                        if(data.code==505){
                            checkForm("#empName_add_input","error",data.msg);
                            return false;
                        }else if(data.code==200){
                            checkForm("#empName_add_input","success",data.msg);
                            $("#empName_add_input").attr("status",true);
                            if(($("#empName_add_input").attr("status")=="true")&&($("#email_add_input").attr("status")=="true")){
                                $("#emp_save").removeClass("btn btn-danger").removeClass("disabled").addClass("btn btn-primary");
                            }
                        }
                    }
                });
            }else{
                checkForm("#empName_add_input","error","用户名必须为6-16数字字母或者2-6中文汉字");
                $("#empName_add_input").attr("status",false);
                return false;
            }
        });


    /****
     * 校验邮箱
     * /
     */
        /*$(document).on("change","#email_add_input #email_update_input",function () {
            //恢复保存按钮样式
            //$("#emp_save").removeClass("btn btn-danger").addClass("btn btn-primary").removeClass("disabled");
            //校验邮箱地址
            var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(regEmail.test($("#email_add_input").val())){
                checkForm("#email_add_input","success","邮箱可用");
                $("#email_add_input").attr("status",true);
                if(($("#empName_add_input").attr("status")=="true")&&($("#email_add_input").attr("status")=="true")){
                    $("#emp_save").removeClass("btn btn-danger").removeClass("disabled").addClass("btn btn-primary");
                }
            }else{
                checkForm("#email_add_input","error","邮箱格式不正确");
                $("#email_add_input").attr("status",false);
                return false;
            }
        });*/
        $('#email_add_input,#email_update_input').change(function () {
            //恢复保存按钮样式
            //$("#emp_save").removeClass("btn btn-danger").addClass("btn btn-primary").removeClass("disabled");
            //校验邮箱地址
            var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(regEmail.test($(this).val())){
                checkForm("#email_add_input","success","邮箱可用");
                $(this).attr("status",true);
                if(($("#empName_add_input").attr("status")=="true")&&($("#email_add_input").attr("status")=="true")){
                    $("#emp_save").removeClass("btn btn-danger").removeClass("disabled").addClass("btn btn-primary");
                }
            }else{
                checkForm("#email_add_input","error","邮箱格式不正确");
                $("#email_add_input").attr("status",false);
                return false;
            }
        });


    /***
     * 保存员工信息
     */

    $("#emp_save").click(function () {
        //先判断校验状态
        if($("#emp_save").hasClass("disabled")){
            return false;
        }
        $.ajax({
            url:"${BASE_PATH}/emp",
            type:"post",
            data:$("#empAddModel form").serialize(),
            success:function (data) {
                console.log(data);
                if(data.code==505){
                    alert(data.result.error.email);
                    if(undefined != data.result.error.email){
                        checkForm("#email_add_input","error",data.result.error.email);
                        $("#emp_save").addClass("disabled");
                    }
                    if(undefined != data.result.error.empName){
                        checkForm("#empName_add_input","error",data.result.error.empName);
                        $("#emp_save").addClass("disabled");
                    }
                    return false;
                }else{
                    //关闭模态框
                    $("#empAddModel").modal("hide");
                    //显示最后一页数据
                    toPage(total);
                }

            }
        })
    })
    /****
     *  显示表单校验信息
     */
    function checkForm(ele,status,msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next().text("");
        if(status == "success"){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if(status == "error"){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    /**
     * 员工信息修改
     */
    //绑定点击事件.live()高版本不可用 on()替换
    $(document).on("click",".edit_btn",function () {
        getDepts("#depts_update");
        getEmp($(this).attr("edit-id"));
        $("#empUpdateModel").modal({
            backdrop : "static"
        });
    });

    /**
     * 根据id查询员工
     * @param id
     */
    function getEmp(id) {
        $.ajax({
            url:"${BASE_PATH}/emp/"+id,
            type:"get",
            success:function (data) {
                console.log(data);
                $("#empName_update").text(data.result.emp.empName);
                $("#email_update_input").val(data.result.emp.email);
                $("#empUpdateModel input[name='gender']").val([data.result.emp.gender]);
                $("#empUpdateModel select").val([data.result.emp.dId]);
            }
        })
    }

    $("#emp_update").click(function () {

    });

</script>
</body>
</html>
