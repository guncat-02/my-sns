<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
<!-- 다크 테마를 기본 값으로-->
<link id="theme-setting" rel="stylesheet"
	href="./resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/selProfile.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body class="theme">
	<div id="selectProfileTitle">
		<span>SELECT YOUR PROFILE</span>
		<p>각 프로필마다 새로운 채팅을 즐길 수 있습니다!</p>
	</div>
	<div id="selectProfile">
		<c:forEach var="pro" items="${profile}">
			<div class="selProfile">
				<div class="selectProfileCircle">
					<img src="download?filename=${pro.photo}">
				</div>
				<div class="selectProfileNick">
					<span>${pro.nickName}</span>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
<script>
    $('.selProfile').click(function() {
        location.href = "newChat?nickName="+$(this).find('span').text();
    })
</script>
</html>