<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>用户登录验证</title>
</head>
<body>

<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String userName = request.getParameter("username");
    String password = request.getParameter("password");
    Connection conn = null;
    Connection conn2 = null;
    Statement st = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    boolean flag1=false;
    boolean flag2=false;
%>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/robot?useUnicode=true&characterEncoding=gbk";
        conn = DriverManager.getConnection(url,"root","123456");
        PreparedStatement sql =conn.prepareStatement("select * from userinfo where userName=? and Password=?");
        sql.setString(1,userName);
        sql.setString(2,password);
        rs=sql.executeQuery();
        if (rs.next()) {
            flag1=true;
        }
        rs.close();
        sql.close();
        conn.close();

        conn2 = DriverManager.getConnection(url,"root","123456");
        PreparedStatement sql2 =conn2.prepareStatement("select * from managerinfo where ManagerName=? and Password=?");
        sql2.setString(1,userName);
        sql2.setString(2,password);
        rs2=sql2.executeQuery();
        if (rs2.next()) {
            flag2=true;
        }
        rs2.close();
        sql2.close();
        conn2.close();
        if(flag1 == true){
            session.setAttribute("USERNOW",userName);
            response.sendRedirect("main.jsp");
        }
        else if(flag2 == true){
            session.setAttribute("MANAGERNOW",userName);
            response.sendRedirect("main2.jsp");
        }
        else{
            response.sendRedirect("login.jsp");
        }
    }catch (Exception e){
        e.printStackTrace();
    }
    %>



</body>
</html>
