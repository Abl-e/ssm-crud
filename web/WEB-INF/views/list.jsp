<%--
  User: 唐国翔
  Date: 2017/9/7 0007
  Time: 10:59
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
    pageContext.setAttribute("BASE_PATH",request.getContextPath());
%>
<html>
<head>
    <script src="${BASE_PATH}/static/js/jquery-3.2.1.min.js"></script>
    <link href="${BASE_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${BASE_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <title>员工列表页面</title>
</head>
<body>
    <c:set value="${requestScope.pageInfo}" var="pageInfo"/>
    <!-- 搭建页面 -->
    <div class="container">
        <!-- 标题 -->
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <!-- 按钮 -->
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${requestScope.pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=="M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <!-- 显示分页信息 -->
        <div class="row">
            <!-- 分页文字信息 -->
            <div class="col-md-6">
                当前${requestScope.pageInfo.pageNum}页，总${requestScope.pageInfo.pages}页,总共${requestScope.pageInfo.total}条记录。
            </div>
            <!-- 分页条信息 -->
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${BASE_PATH}/emps?page=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${BASE_PATH}/emps?page=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${requestScope.pageInfo.navigatepageNums}" var="pageNum">
                            <c:if test="${pageNum==requestScope.pageInfo.pageNum}">
                                <li class="active"><a href="#">${pageNum}</a></li>
                            </c:if>
                            <c:if test="${pageNum!=requestScope.pageInfo.pageNum}">
                                <li><a href="${BASE_PATH}/emps?page=${pageNum}">${pageNum}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${BASE_PATH}/emps?page=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${BASE_PATH}/emps?page=${pageInfo.pages}">末页 </a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</body>
</html>
