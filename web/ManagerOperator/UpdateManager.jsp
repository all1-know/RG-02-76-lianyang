<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2018/12/7
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改管理员信息</title>
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
                <a href="SearchManagerInfo.jsp" target="main">个 人 信 息 查 询</a>
            </td>
            <td width="22%">
                个 人 信 息 修 改
            </td>
        </tr>
    </table>
</div>
<hr noshade>
<div class="table-users">
    <div class="header">管 理 员 信 息</div>

    <table>
        <tr>
            <th>管理员编号</th>
            <th>管理员姓名</th>
            <th>密码</th>
            <th>电话</th>
            <th>是否修改</th>
        </tr>
        <jsp:useBean id="dbo" scope="application"  class="DBOP.DBOperator"/>
        <%
            String sql = "select * from managerinfo";
            ResultSet rs = dbo.select(sql);
            while (rs.next()){
        %>
        <tr>
            <td><%=rs.getString("ManagerID")%></td>
            <td style="font-size:0.9em"><%=rs.getString("ManagerName")%></td>
            <td><%=rs.getString("Password")%></td>
            <td><%=rs.getString("Telephone")%></td>
            <td align="center"><a class="btn btn-outline-success"  href="UpdateManagerInfo.jsp?ManagerID=<%=rs.getString("ManagerID")%>" target="main">修  改</a></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</div>
</body>
</html>
