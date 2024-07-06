<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
    <link rel="stylesheet" href="./resources/css/profileList.css">
    <!-- 다크 테마를 기본 값으로-->
    <link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body class="theme">
    <div id="chatAll">
        <div id="chatMenu">
            <ul>
                <li><a href="main">SNS</a></li>
                <li>PROFILE</li>
            </ul>
        </div>
        <div id="newProfileTitle">
            <span>MY M PROFILE</span>
        </div>
        <div id="newProfile">
            <div id="mainProfile">
            	<c:forEach var="p" items="${profile}">
                	<c:if test="${p.p_main == 1}">
                		<div id="mainProfilePhoto">
                    		<div id="mainProfileCircle">
                    			<c:choose>
                    				<c:when test="${p.photo != null}">
                        				<img src="download?filename=${p.photo}" id="mainProfileImg">
                        			</c:when>
                        			<c:when test="${p.photo == null}">
                        				<img src="./resources/img/프로필.png" id="mainProfileImg">
                        			</c:when>
                        		</c:choose>
                    		</div>
                		</div>
                		<div id="mainProfileInfo">
                    		<span id="mainNick">${p.nickName}</span>
                    		<c:if test="${p.bio != null}">
                    			<span id="mainBio">${p.bio}</span>
                    		</c:if>
                		</div>
                	</c:if>
                </c:forEach>
            </div>
            <div id="userProfileList">
            	<c:forEach var="p" items="${profile}">
            		<c:if test="${p.p_main == 0}">
                		<div class="userProfile">
                    		<div class="userProfilePhoto">
                        		<div class="userProfileCircle">
                        			<c:choose>
                        				<c:when test="${p.photo != null}">
                        					<img src="download?filename=${p.photo}" id="mainProfileImg">
                        				</c:when>
                        				<c:when test="${p.photo == null}">
                        					<img src="./resources/img/프로필.png" id="mainProfileImg">
                        				</c:when>
                        			</c:choose>
                        		</div>
                    		</div>
                    		<div class="userProfileInfo">
                        		<span class="userNick">${p.nickName}</span>
                        		<c:if test="${p.bio != null}">
                        			<span class="userBio">${p.bio}</span>
                        		</c:if>
                    		</div>
                		</div>
                	</c:if>
                </c:forEach>
                <div id="userPlus">
                    <div id="userPlusCircleCircle">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
                        </svg>
                    </div>
                    <div id="userPlusInfo">
                        <span>M PROFILE</span>
                    </div>
                </div>
            </div>
        </div>
        <div id="newProfileInfo">
            <span>MAIN PROFILE 을 포함한 모든 프로필은 M 에서 사용하실 수 있습니다.</span>
            <P>* PROFILE 은 3개까지 생성할 수 있습니다.</P>
        </div>
    </div>
</body>
<script>
    window.onload = function() {
        if($('.userProfile').length == 2) {
            $('#userPlus').css('display', 'none');
        }
    }
    
    //프로필 추가하기
</script>
</html>