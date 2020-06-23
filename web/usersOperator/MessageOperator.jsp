<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>用户留言管理</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/SearchMyInfo.css">
</head>
<body>
<br>
<hr noshade>
<div align="center">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
        <tr>
            <td width="20%">
                <a href="SearchMyInfo.jsp" target="main">个 人 信 息 查 询</a>
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
                留言管理
            </td>
        </tr>
    </table>
</div>
<hr noshade>
<div class="table-users">
    <div class="header">留 言 中 心</div>
    <table>
        <tr>
            <th>留言主题</th>
            <th>留言内容</th>
            <th>留言日期</th>

            <th>删除</th>
        </tr>
        <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
            String sql = "select * from messageinfo where userName='"+ session.getAttribute("USERNOW") +"'";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
        %>
        <tr>
            <td><%=rs.getString("Title")%></td>
            <td><%=rs.getString("Message")%></td>
            <td><%=rs.getString("Time")%></td>
            <td><a class="btn btn-outline-danger" href="DataBaseForMessage.jsp?Time=<%=rs.getString("Time")%>"  target="main">删    除</a></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</div>
</body>
</html>
