<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="DBOP.DBOperator" %>--%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dbo" class="DBOP.DBOperator" scope="application"/>
<body>
<%

    request.setCharacterEncoding("UTF-8");

    String Email=request.getParameter("Email");
    String userName=request.getParameter("userName");
    String Telephone =request.getParameter("Telephone");
    String Age =request.getParameter("Age");
    String Password =request.getParameter("Password");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/robot?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8&useSSL=false","root","123456");
        Statement stmt = con.createStatement();

        String sql="insert userinfo (Email,userName,Telephone,Age,Password) values ('" + Email + "','" + userName + "','" + Telephone + "','" + Age + "','"+ Password +"')";
        int validate = stmt.executeUpdate(sql);
        if (validate > 0){
            response.sendRedirect("SearchUser.jsp");
        }else{
            out.println("<font color='red'>出错了！！！</font>");
        }
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
