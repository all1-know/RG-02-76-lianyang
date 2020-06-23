<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息管理</title>
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
                <a href="SearchUser.jsp" target="main">所 有 用 户</a>
            </td>
            <td width="22%">
                <a href="UpdateUser.jsp" target="main">用 户 信 息 修 改</a>
            </td>
            <td width="22%">
                添  加  用  户
            </td>
            <td width="22%">
                <a href="DeleteUser.jsp" target="main">删  除  用  户</a>
            </td>

        </tr>
    </table>
</div>
<hr noshade>
<div class="table-users">
    <div class="header">添加用户信息</div>
    <form action="Insert_done.jsp" method="post">
    <table>
        <tr>
            <td>昵称</td>
            <td><input type="text" name="userName"></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td><input type="text" name="Eamil"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="Telephone"></td>
        </tr>
        <tr>
            <td>年龄</td>
            <td><input type="text" name="Age"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="text" name="Password"></td>
        </tr>
    </table>
    <center>
        <tr align="center">
            <td colspan="2">
                <input type="submit" name="sure" value="添     加">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" name="clear" value="取     消">
            </td>
        </tr>
    </center>

    <jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
    <%
        try{
            String userName = new String(request.getParameter("userName").getBytes("ISO-8859-1"),"UTF-8");
            String Email = new String(request.getParameter("Email").getBytes("ISO-8859-1"),"UTF-8");
            String Telephone = new String(request.getParameter("Telephone").getBytes("ISO-8859-1"),"UTF-8");
            String Age = new String(request.getParameter("Age").getBytes("ISO-8859-1"),"UTF-8");
            String Password = new String(request.getParameter("Password").getBytes("ISO-8859-1"),"UTF-8");

            String sql = "insert into userinfo values('"+Email+"','"+userName+"','"+Password+"','"+Age+"'，'"+Telephone+"')";
            dbo.insert(sql);
        }catch (Exception e){
            e.printStackTrace();
        }

    %>

</div>
</body>
</html>
