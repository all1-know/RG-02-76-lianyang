<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2018/12/11
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>修改管理员信息</title>
    <link rel="stylesheet" type="text/css" href="../css/SearchMyInfo.css">
    <script src="http://wow.techbrood.com/libs/jquery/jquery-1.11.1.min.js"></script>
</head>
<body>
<hr noshade>
<div class="table-users">
    <div class="header">修改管理员信息</div>
    <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
        <%
        String ManagerID=request.getParameter("ManagerID");
        Connection con=null;
        ResultSet rs=null;
        Statement stmt=null;
        con = dbo.getConnection();
        stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
       	                            ResultSet.CONCUR_READ_ONLY);
        rs=stmt.executeQuery("select * from managerinfo where ManagerID='"+ManagerID+"'");
        session.setAttribute("ManagerID", request.getParameter("ManagerID"));
        while (rs.next()){
            session.setAttribute("ManagerID", rs.getString("ManagerID"));
            session.setAttribute("ManagerName", rs.getString("ManagerName"));
            session.setAttribute("Password", rs.getString("Password"));
            session.setAttribute("Telephone", rs.getString("Telephone"));
        }
    %>
    <form action="DataBaseUpdateManager.jsp" method="post">
        <table>
            <tr>
                <td>管理员编号</td>
                <td><input type="text" name="ManagerID" value="<%=session.getAttribute("ManagerID")%>"></td>
            </tr>
            <tr>
                <td>管理员姓名</td>
                <td><input type="text" name="ManagerName" value="<%=session.getAttribute("ManagerName")%>"></td>
            </tr>
            <tr>
                <td>管理员密码</td>
                <td><input type="text" name="Password" value="<%=session.getAttribute("Password")%>"></td>
            </tr>
            <tr>
                <td>管理员电话</td>
                <td><input type="text" name="Telephone" value="<%=session.getAttribute("Telephone")%>"></td>
            </tr>
        </table>
        <center>
            <tr align="center">
                <td colspan="2">
                    <input type="submit" name="sure" value="修     改">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" name="clear" value="取     消">
                </td>
            </tr>
        </center>
    </form>
</body>
</html>
