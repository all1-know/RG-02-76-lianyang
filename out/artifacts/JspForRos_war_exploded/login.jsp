<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Marvel宇宙---登录界面</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="js/main.js"></script>

    <script language="JavaScript">
        function isValid(from) {
            if(from.username.value == ""){
                alert("用户名不能为空！");
                return false;
            }
            if(from.password.value == ""){
                alert("密码不能为空！");
                return false;
            }
        }
    </script>
</head>


<body>
<%--<img align="center" alt="" src="images/login.jpg">--%>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<center>
    <form action="loginCheck.jsp" method="post">

            <fieldset>

                <legend>Sign In</legend>

                <label for="username" class="vhide">Username</label>
                <input id="username" name="username" type="text" placeholder="Username" required minlength="2" style="color: #24d6a6">

                <label for="password" class="vhide">Password</label>
                <input id="password" name="password" type="password" placeholder="Password" required minlength="6" style="color: #24d6a6;height: 33px;font-size: 1.2em">

                <input type="checkbox" name="remember" id="remember" class="vhide">
                <label for="remember">
                    <i class="octicon octicon-check"></i> Remember all the things
                </label>
                    <button class="signin">Sign in</button>

            </fieldset>

    </form>
    <fieldset>
        <form action="register.jsp" method="post">
            <button class="Register">Register</button>
        </form>
    </fieldset>
    <%--<a class="signin" href="loginCheck.jsp" target="_self">Sign In</a>--%>
    <%--<a class="signin" href="register.jsp?" target="main">Register</a>--%>
</center>
</body>
</html>
