<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="userinfo" class="DBOP.UserInfo" scope="request">
    <jsp:setProperty name="userinfo" property="*" />
</jsp:useBean>

<jsp:useBean id="register" class="DBOP.UserRegister" scope="request">
    <jsp:setProperty name="register" property="*"/>
</jsp:useBean>

<html>
<head>
    <title>Marvel---注册界面</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/main.js"></script>
    <script language="javascript">
        function isValid()
        {
            var username = $("#username").val()
            var password1 = $("#password").val()
            var password2 = $("#password2").val()
            if (username = "")
            {
                alert("用户名不能为空");
                return false;
            }
            if (password1 != password2)
            {
                alert("两次输入的密码不同！请重新输入！");
                window.location.reload();
            }
            else if (password1 == "")
            {
                alert("用户密码不能为空！");
                return false;
            }
            else
                return true;
        }
    </script>

</head>
<body>
<br><br><br><br><br><br>
<br><br><br><br><br><br>

<center>
        <form action="RegisterCheck.jsp" method="post">

            <fieldset>

                <legend>Register</legend>

                <label for="username" class="vhide">Username</label>
                <input id="username" name="username" type="text" placeholder="Input Username" required minlength="2" style="color: #24d6a6">

                <label for="password" class="vhide">Password</label>
                <input id="password" name="password" type="password" placeholder=" Input Password" required minlength="6" style="color: #24d6a6;height: 33px;font-size: 1.2em">
                <br>

                <label for="password2" class="vhide">Password again</label>
                <input id="password2" name="password2" type="password" placeholder=" Input Password again" required minlength="6" style="color: #24d6a6;height: 33px;font-size: 1.2em">
                <br>

                <label for="Email" class="vhide">Email</label>
                <input id="Email" name="Email" type="text" placeholder="Input Email" style="color: #24d6a6">
                <label for="Telephone" class="vhide">Telephone</label>
                <input id="Telephone" name="Telephone" type="text" placeholder="Input Telephone" style="color: #24d6a6">
                <label for="Age" class="vhide">Age</label>
                <input id="Age" name="Age" type="text" placeholder="Input Age" style="color: #24d6a6">
                <button class="signin" onclick="isValid()">Register</button>
            </fieldset>
        </form>
</center>
</body>

</html>
