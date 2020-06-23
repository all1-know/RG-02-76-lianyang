<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册与数据库添加</title>
</head>
<body>
    <jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
    <%
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String userName = request.getParameter("username");
        String Password = request.getParameter("password");
        String Email = request.getParameter("Email");
        String Telephone = request.getParameter("Telephone");
        String Age = request.getParameter("Age");
    %>
    <%
        try{
            String sql = "insert into userinfo values('"+ Email +"','"+ userName +"','"+ Password +"','"+ Age +"','"+ Telephone +"')";
            dbo.insert(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
    %>

    <jsp:forward page="login.jsp"/>
</body>
</html>
