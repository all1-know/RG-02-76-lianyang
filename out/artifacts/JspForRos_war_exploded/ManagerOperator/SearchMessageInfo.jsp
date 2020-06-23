<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2018/12/9
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>用户信息管理</title>
    <link rel="stylesheet" type="text/css" href="../css/SearchMyInfo.css">
    <script src="http://wow.techbrood.com/libs/jquery/jquery-1.11.1.min.js"></script>
</head>
<body>
<br>
<hr noshade>

<hr noshade>

<div class="table-users">
    <div class="header">留 言 管 理</div>
    <table>
        <tr>
            <th>留言用户</th>
            <th>留言主题</th>
            <th>留言内容</th>
            <th>留言时间</th>
            <th>留言删除</th>
        </tr>

        <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
            String sql = "select * from messageinfo";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
                session.setAttribute("userName", rs.getString("userName"));
                session.setAttribute("Title", rs.getString("Title"));
                session.setAttribute("Message", rs.getString("Message"));
                session.setAttribute("Time", rs.getString("Time"));
        %>
        <tr>
            <td><%=rs.getString("userName")%></td>
            <td><%=rs.getString("Title")%></td>
            <td><%=rs.getString("Message")%></td>
            <td><%=rs.getString("Time")%></td>

            <td><a class="btn btn-outline-danger" href="DataBaseForMessageDelete.jsp?Time=<%=rs.getString("Time")%>"  target="main">删    除</a></td>
        </tr>
        <%
            }
            rs.close();
        %>

    </table>
</div>
</body>
</html>
