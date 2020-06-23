<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>

<html>
<head>
    <title>博客管理</title>
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
                <a href="SearchMyInfo.jsp">个 人 信 息 查 询</a>
            </td>
            <td width="20%">
                <a href="UpdateMyInfo.jsp" target="main">个 人 信 息 修 改</a>
            </td>
            <td width="20%">
                博 客 管 理
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
    <div class="header">我 的 博 客</div>
    <table>
        <tr style="text-align: center">
            <th>发表时间</th>
            <th>博客题目</th>
            <th>是否删除</th>
        </tr>
        <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
            String sql = "select * from blogsinfo where userName = '"+ session.getAttribute("USERNOW") +"'";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
        %>
        <tr style="text-align: center">
            <td><%=rs.getString("Time")%></td>
            <td><%=rs.getString("BlogTitle")%></td>
            <td><a class="btn btn-outline-danger" href="DataBaseDeleteBlog.jsp?BlogTitle=<%=rs.getString("BlogTitle")%>" style="text-align: center;"  target="main">删    除</a></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</div>

</body>
</html>
