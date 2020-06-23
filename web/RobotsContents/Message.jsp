<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>影片评价</title>
    <link rel="stylesheet" type="text/css" href="../css/Message.css">
</head>
<body>
<form action="../usersOperator/AddMessage.jsp" method="post">
    <div class="shade">
        <div class="blackboard">
            <div class="form">
                <p>
                    <label>Title: </label>
                    <input type="text" name="Title" value=<%=request.getParameter("name")%>>
                </p>
                <br>
                <br>
                <p>
                    <label>Message: </label>
                    <textarea name="Message" required minlength="5"></textarea>
                </p>
                <br>
                <br><br>
                <br><br>
                <br>
                <p class="wipeout">
                    <input type="submit" value="Send" />
                </p>
            </div>
        </div>
    </div>
</form>
</body>
</html>
