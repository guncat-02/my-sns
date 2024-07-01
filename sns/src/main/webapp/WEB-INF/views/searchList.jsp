<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="./resources/css/searchList.css">
    <link rel="stylesheet" href="./resources/css/search.css">
    <!-- 다크 테마를 기본 값으로-->
    <link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body class="theme">
    <div id="all">
        <div id="menuall">
            <%@ include file="menuAll.jsp"%>
        </div>
        <div id="main">
            <!--메인 컨텐츠는 여기에 작성 부탁합니당-->
            <form action="searchList" method="get" onsubmit="return searchSubmit()">
                <div id="searchBar" class="theme">
                    <input type="search" id="search" placeholder="SEARCH" autocomplete='off'>
                    <div id="miniSearch">
                        <div id="miniSearchTitle">
                            <span id="searDel">모두 지우기</span>
                        </div>
                        <table id="miniSearchTable">
                            
                        </table>
                    </div>
                </div>
            </form>
            <div id="searMenuBar">
                <ul id="searMenu">
                    <li>
                        <span class="keyType" id="nowKeyType">인기</span>
                    </li>
                    <li>
                        <span class="keyType">최신</span>
                    </li>
                    <li>
                        <span class="keyType">마음</span>
                    </li>
                    <li>
                        <span class="keyType">리포스트</span>
                    </li>
                    <li>
                        <span class="keyType">사용자</span>
                    </li>
                </ul>
            </div>
            <div id="searResult">

            </div>
        </div>
    </div>
</body>
</html>