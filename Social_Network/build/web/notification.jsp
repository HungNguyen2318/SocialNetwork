<%-- 
    Document   : home_page
    Created on : Sep 22, 2020, 1:31:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/home_page.css" rel="stylesheet">
        <link href="./css/style_imgur.css" rel="stylesheet" media="screen">
        <link href="./css/mobile-style.css" rel="stylesheet" media="screen">
        <link rel="shortcut icon" href="./favicon.png">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Home Page</title>
    </head>   
    <body>
        <div id="header">
            <div id="logo">
                <h1 class="material-icons" style="font-size:44px;padding-right: 0px;">public</h1><h1> Mini World</h1>
            </div>
            <div id="search_bar">
                <form action="DispathController" method="post">
                    <input type="text" id="search_field" value="${param.txtSearchValue}" name="txtSearchValue">
                    <input  type="submit" id="btn_noti" class="material-icons" value="search" name="btAction"/>
                </form>
            </div>
            <div id="group_button">
                <form action="DispathController" method="post">
                    <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                    <input type="hidden" name="txtSearchValue" value="">
                    <input id="btn_noti" type="submit" name="btAction" value="home" class="material-icons"/>
                    <input id="btn_noti" type="submit" name="btAction" value="notifications" class="material-icons"/>
                    <input id="btn_sign_out" type="submit" name="btAction" value="exit_to_app" class="material-icons"/>
                </form>
            </div>
            <div id="welcome">
                Welcome, ${sessionScope.USER.username}
            </div>
        </div>
        <div id="profile">
            <img id="avata" alt="Imgur-Upload" src="${sessionScope.USER.image}"/>
            Name: <span id="name">${sessionScope.USER.username}</span></br>
            Birthday: <span id="birdday">${sessionScope.USER.birthday}</span></br>
            Gender: <span id="gender">${sessionScope.USER.gender}</span></br>
            Created Day: <span id="createday">${sessionScope.USER.createdDate}</span></br>
        </div>
        <div id="content">
            
            <div id="list_article_div">
                <c:set var="listOfNotification" value="${requestScope.ListOfNotification}"/>
                <c:if test="${empty ListOfNotification}">
                    <h1>No notifications available</h1>
                </c:if>
                <c:if test="${not empty listOfNotification}">
                    <c:forEach var="notificationDto" items="${listOfNotification}">
                        <div id="notification_div">
                            <p>${notificationDto.contentNotification}</p>                           
                            Created Day: <i id="createday">${notificationDto.createdDate}</i></br>
                            <hr>
                        </div>
                        <form action="DispathController" method="post">
                            <input type="hidden" name="txtArticleId" value="${notificationDto.articleId}">
                            <input type="submit" name="btAction" value="View Detail">
                        </form>
                    </c:forEach>
                </c:if>

            </div>
        </div>
        <script type="text/javascript" src="./js/imgur.js"></script>
        <script type="text/javascript" src="./js/upload.js"></script>
        <script>
                        function showPost() {
                            var hidden = document.getElementById("post_div");
                            hidden.style.display = "block";
                        }
                        function hidePost() {
                            var hidden = document.getElementById("post_div");
                            hidden.style.display = "none";
                        }
                        function myFunction() {
                            confirm("Press a button!");
                        }
                        function changeBacground() {
                            var typeId = document.getElementById("typeId").value;
                            var btn_like = document.getElementById("btn_like");
                            var btn_dislike = document.getElementById("btn_dislike");
                            if (typeId === "") {
                                btn_like.style.backgroundColor = "#EFEFEF";
                                btn_dislike.style.backgroundColor = "#EFEFEF";
                            } else if (typeId === "1") {
                                btn_like.style.backgroundColor = "#166FE5";
                                btn_like.style.color = "#FFFFFF"
                                btn_dislike.style.backgroundColor = "#EFEFEF";
                            } else if (typeId === "2") {
                                btn_like.style.backgroundColor = "#EFEFEF";
                                btn_dislike.style.backgroundColor = "#FF7979";
                                btn_dislike.style.color = "#FFFFFF"
                            } else if (typeId === "3") {
                                btn_like.style.backgroundColor = "#EFEFEF";
                                btn_dislike.style.backgroundColor = "#EFEFEF";
                            }
                        }
        </script>
    </body>
</html>
