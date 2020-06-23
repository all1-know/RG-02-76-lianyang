<%@ page import="java.sql.*" %>
<%@ page import="DBOP.DBOperator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询个人信息</title>
    <link rel="stylesheet" type="text/css" href="../css/SearchMyInfo.css">
    <script src="http://wow.techbrood.com/libs/jquery/jquery-1.11.1.min.js"></script>
</head>
<body>
<br>
<hr noshade>
<div align="center">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td width="20%">
                个 人 信 息 查 询
            </td>
            <td width="20%">
                <a href="UpdateMyInfo.jsp" target="main">个 人 信 息 修 改</a>
            </td>
            <td width="20%">
                <a href="BlogsManage.jsp" target="main">博 客 管 理</a>
            </td>
            <td width="20%">
                <a href="SearchMyShopping.jsp" target="main">影片收藏</a>
            </td>
            <td width="20%">
                <a href="MessageOperator.jsp" target="main">留言管理</a>
            </td>
        </tr>
    </table>
</div>
<hr noshade>
<div class="table-users">
    <div class="header">UsersInfomation</div>
    <table>
        <tr>
            <th>昵称</th>
            <th>年龄</th>
            <th>邮箱</th>
            <th width="150">电话</th>
        </tr>
        <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
            String sql = "select * from userinfo where userName='"+ session.getAttribute("USERNOW") +"'";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
        %>
        <tr>
            <td><%=rs.getString("userName")%></td>
            <td><%=rs.getString("Age")%></td>
            <td><%=rs.getString("Email")%></td>
            <td><%=rs.getString("Telephone")%></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</div>
</body>
</html>
