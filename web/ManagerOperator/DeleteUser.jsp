<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>

<html>
<head>
    <title>删除用户信息界面</title>
    <link rel="stylesheet" type="text/css" href="../css/SearchMyInfo.css">
    <script src="http://wow.techbrood.com/libs/jquery/jquery-1.11.1.min.js"></script>
</head>
<body>
<br>
<hr noshade>
<div align="center">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td width="22%">
                <a href="SearchUser.jsp" target="main">用 户 信 息 查 询</a>
            </td>
            <td width="22%">
                <a href="UpdateUser.jsp" target="main">用 户 信 息 修 改</a>
            </td>
            <td width="22%">
                <a href="AddUser.jsp" target="main">添  加  用 户</a>
            </td>
            <td width="22%">
                删  除  用  户
            </td>
        </tr>
    </table>
</div>
<div class="table-users">
    <div class="header">UsersInfomation</div>
    <table>
        <tr>
            <th>昵称</th>
            <th>年龄</th>
            <th>邮箱</th>
            <th width="150">电话</th>
            <th>是否删除</th>
        </tr>
        <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
            String sql = "select * from userinfo";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
                session.setAttribute("userName", rs.getString("userName"));
                session.setAttribute("Email", rs.getString("Email"));
                session.setAttribute("Telephone", rs.getString("Telephone"));
                session.setAttribute("Age", rs.getString("Age"));
                session.setAttribute("Password", rs.getString("Password"));
        %>
        <tr>
            <td><%=rs.getString("userName")%></td>
            <td><%=rs.getString("Age")%></td>
            <td><%=rs.getString("Email")%></td>
            <td><%=rs.getString("Telephone")%></td>
            <td><a class="btn btn-outline-danger" href="DataBaseDeleteUser.jsp?Email=<%=rs.getString("Email")%>"  target="main">删    除</a></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</div>
</body>
</html>
