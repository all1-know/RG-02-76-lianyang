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
    <title>修改用户信息</title>
    <link rel="stylesheet" type="text/css" href="../css/SearchMyInfo.css">
    <script src="http://wow.techbrood.com/libs/jquery/jquery-1.11.1.min.js"></script>
</head>
<body>
<hr noshade>
<div class="table-users">
    <div class="header">修改用户信息</div>
    <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
    <%
        String Email=request.getParameter("Email");
        Connection con=null;
        ResultSet rs=null;
        Statement stmt=null;
        con = dbo.getConnection();
        stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
       	                            ResultSet.CONCUR_READ_ONLY);
        rs=stmt.executeQuery("select * from userinfo where Email='"+Email+"'");
        session.setAttribute("Email", request.getParameter("Email"));
        while (rs.next()){
            session.setAttribute("userName", rs.getString("userName"));
            session.setAttribute("Email", rs.getString("Email"));
            session.setAttribute("Telephone", rs.getString("Telephone"));
            session.setAttribute("Age", rs.getString("Age"));
            session.setAttribute("Password", rs.getString("Password"));
        }
    %>
    <form action="DataBaseUpdateUser.jsp" method="post">
        <table>
            <tr>
                <td>昵称</td>
                <td><input type="text" name="userName" value="<%=session.getAttribute("userName")%>"></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="Eamil" value="<%=session.getAttribute("Email")%>"></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><input type="text" name="Telephone" value="<%=session.getAttribute("Telephone")%>"></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="Age" value="<%=session.getAttribute("Age")%>"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="text" name="Password" value="<%=session.getAttribute("Password")%>"></td>
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
