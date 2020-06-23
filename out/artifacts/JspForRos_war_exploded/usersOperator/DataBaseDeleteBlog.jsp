<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客数据库管理</title>
</head>
<body>
<%=request.getParameter("BlogTitle")%>
<jsp:useBean id="dbo" scope="application" class="DBOP.DBOperator"/>
<%
    try {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String sql = "delete from blogsinfo where BlogTitle = '" + request.getParameter("BlogTitle") + "'";
        dbo.delete(sql);
    }catch (Exception e){
        e.printStackTrace();
    }
%>
<jsp:forward page="BlogsManage.jsp"/>
</body>
</html>
