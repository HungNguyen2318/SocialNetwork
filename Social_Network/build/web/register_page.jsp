<%-- 
    Document   : register_new_account
    Created on : Sep 20, 2020, 8:10:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/style.css" rel="stylesheet">
        <link href="./css/style_imgur.css" rel="stylesheet" media="screen">
        <link href="./css/mobile-style.css" rel="stylesheet" media="screen">
        <link rel="shortcut icon" href="./favicon.png">
        <title>Register Page</title>
    </head>
    <body>
        <div>
            <div id="body">
                <div id="body_login_form">
                    <div id="logo">
                        <h1>Mini World</h1>
                        <p>Mini World helps you connect and share with the people in your life.</p>
                    </div>
                    <div id="sign_up_form">                 
                        <form action="DispathController" method="POST"> 
                            <h4>Sign Up</h4>
                            <div id="noti_result_login" >${requestScope.RESIGTERFAILURE}</div>
                            <input type="email" id="email" name="txtEmail" placeholder="Email" required="true"></br>                    
                            <input type="password" id="password" name="txtPassword" 
                                   placeholder="Password" required="true"
                                   onchange="checkConfirmPassword()"
                                   onkeyup="checkConfirmPassword()"
                                   ></br>                           
                            <p id="noti_confirm">Confirm password is not match &#9940;</p>
                            <input type="password" id="confirm_password" name="txtPassword" 
                                   placeholder="Confirm password" required="true" 
                                   onkeyup="checkConfirmPassword()"
                                   ></br>
                            <input type="text" id="username" name="txtUsername" placeholder="Username" required="true">
                            <label>Birthday</label>
                            <input type="date" id="birthday_picker" name="txtBirthday" required="true" placeholder="Birthday">
                            <select id="gender" name="selectGender">
                                <option value="Male" selected="true">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                            <label>Avatar</label>
                            <div class="dropzone">
                                <div class="info">
                                </div>
                            </div>
                            <input type="hidden" name="txtLinkImageAvatar" value="" id="image_avata">
                            <hr>
                            <input type="submit" name="btAction" value="Submit" id="sign_up"
                                   disabled="true"/>
                        </form>
                    </div>           
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="./js/script.js"></script>
    <script type="text/javascript" src="./js/imgur.js"></script>
    <script type="text/javascript" src="./js/upload.js"></script>
</html>
