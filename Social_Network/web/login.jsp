<%-- 
    Document   : login.jsp
    Created on : Sep 18, 2020, 8:34:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="./css/style.css" rel="stylesheet">
    </head>
    <body>
        <c:set var="result" value="${Result}"/>
        <c:if test="${not empty result}">
            <div id="noti_result_active" color="green">${result}</div>
        </c:if>
        <div id="body">
            <div id="body_login_form">
                <div id="logo">
                    <h1>Mini World</h1>
                    <p>Mini World helps you connect and share with the people in your life.</p>
                </div>
                <div id="login_form">
                    <form action="DispathController" method="post">
                        <h4>Sign Up</h4>
                        <c:set var="resultLogin" value="${requestScope.LOGINFAIL}"/>
                        <c:if test="${not empty resultLogin}">
                            <div id="noti_result_login" >${resultLogin}</div>
                        </c:if>
                        <input type="text" id="fname" name="txtEmail" placeholder="Email"></br>                    
                        <input type="password" id="password" name="txtPassword" placeholder="Password"></br>
                        <input type="submit" name="btAction" value="Sign In" id="sign_in">
                        <hr>
                        <input type="submit" name="btAction" value="Sign Up" id="sign_up"/>
                    </form>
                </div>           
            </div>
        </div>
    </body>
    <script type="text/javascript" src="./js/script.js"></script>
</html>
