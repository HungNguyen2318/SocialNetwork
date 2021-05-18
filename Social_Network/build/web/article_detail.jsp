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
    <body onload="changeBacground()">
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
                    <input id="btn_create_post" value="border_color" class="material-icons" onclick="showPost()"/>
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
            <div id="post_div" style="display: none">
                <p
                    onclick="hidePost()"
                    style="float: right;
                    margin: 5px;
                    cursor: pointer"
                    >X
                </p>
                <form id="post_form" action="DispathController" method="post">
                    <input type="text" id="tittle" name="txtTittle" value=""
                           placeholder="Tittle..."
                           style="width: 100%">
                    <br>
                    <textarea id="content_desc" rows="10" cols="127"
                              name="txtContent" form="post_form"
                              style="margin-top: 5px; 
                              background-color: #FFFFFF; 
                              border-radius: 25px;
                              border: 1px solid #cccccc;
                              padding: 12px;
                              width: 98%;
                              resize: none"                                  
                              >
                    </textarea>
                    </br>
                    <div class="dropzone">
                        <div class="info">
                        </div>
                    </div>
                    <input type="hidden" name="txtLinkImageArticle" value="" id="image_avata">
                    <input type="submit" name="btAction" value="Post" id="btn_post"/>
                </form>
            </div>
            <div id="list_article_div">
                <c:set var="articleDto" value="${requestScope.ArticleDetail}"/>
                <c:set var="emotionDto" value="${requestScope.EmotionDto}"/>
                <c:if test="${empty articleDto}">
                    <h2>Opp Sorry!!! This article was deleted</h2>
                </c:if>
                <c:if test="${not empty articleDto}">
                    <div id="article_div">
                        <h3>${articleDto.email}</h3>
                        <h3>${articleDto.tittle}</h3>
                        <p>${articleDto.contentArticle}</p>
                        <img id="avata" alt="Imgur-Upload" src="${articleDto.linkImageArticle}" style="height: 500px;"/>
                        Created Day: <span id="createday">${articleDto.createdDate}</span></br>
                        <hr>
                    </div>

                    <div id="emotions_div" onload="changeBacground()">

                        <form action="DispathController" method="post">               
                            <input type="hidden" name="txtEmailAuthor" value="${articleDto.email}">
                            <input type="hidden" name="txtTittle" value="${articleDto.tittle}">
                            <input type="hidden" name="txtArticleId" value="${articleDto.articleId}">
                            <input id="typeId" type="hidden" name="txtTypeId" value="${emotionDto.typeId}">
                            <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                            <p id="number_like">Like: ${requestScope.NumberOfLike}</p><p id="number_dislike">Dislike: ${requestScope.NumberOfDislike}</p>
                            <input id="btn_like" type="submit" name="btAction" value="Like">                               
                            <input id="btn_dislike" type="submit" name="btAction" value="Dislike">                                
                        </form>
                    </div>
                    <div id="comments_div">
                        <c:set var="listOfComment" value="${requestScope.ListOfComment}"/>
                        <c:if test="${not empty listOfComment}">
                            <c:forEach var="commentDto" items="${listOfComment}">
                                <div id="comment">
                                    <b>${commentDto.email}</b>
                                    <p>${commentDto.content}</p>
                                    <c:if test="${sessionScope.USER.email == commentDto.email}">
                                        <form action="DispathController" method="post">
                                            <input type="hidden" name="txtArticleId" value="${articleDto.articleId}">
                                            <input type="hidden" name="txtCommentId" value="${commentDto.commentId}">
                                            <input onclick="return confirm('This article will be deleted. Are you sure ?');" type="submit" name="btAction" value="Delete Comment">
                                        </form>
                                    </c:if>
                                    <hr>
                                </div>
                            </c:forEach>                           
                        </c:if>
                        <form action="DispathController" method="post">
                            <input type="text" name="txtContentComment" value="" style="width: 70%">
                            <input type="hidden" name="txtArticleId" value="${articleDto.articleId}">
                            <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                            <input type="hidden" name="txtEmailAuthor" value="${articleDto.email}">
                            <input type="hidden" name="txtTittle" value="${articleDto.tittle}">
                            <input type="submit" name="btAction" value="Post Comment">
                        </form>
                    </div>
                    <form action="DispathController" method="post">
                        <c:if test="${sessionScope.USER.email == articleDto.email}">
                            <input type="hidden" name="txtSearchValue" value="${param.txtSearchValue}">
                            <input type="hidden" name="txtArticleId" value="${articleDto.articleId}">
                            <input onclick="return confirm('This article will be deleted. Are you sure ?');" type="submit" name="btAction" value="Delete">
                        </c:if>
                    </form>
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
