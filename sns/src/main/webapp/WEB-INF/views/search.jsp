<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
<link rel="stylesheet" href="./resources/css/search.css">
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
                    <input type="search" id="search" placeholder="SEARCH">
                    <div id="miniSearch">
                        <div id="miniSearchTitle">
                            <span id="searDel">모두 지우기</span>
                        </div>
                        <table id="miniSearchTable">
                            
                        </table>
                    </div>
                </div>
            </form>
            <div id="trendyTitle">
                <span>TRENDY</span>
            </div>
            <div id="trendyDiv">
                <div id="trendy">
                    <table id="trendyTable">
                        <tr>
                            <td style="width: 90%;" class="trendyWord"><span>안녕</span><p>2000 posts</p></td>
                            <td style="width: 10%; text-align: right;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
                                    <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
                                  </svg>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="plusTrendy">
                <span>+</span>
            </div>
        </div>
    </div>
</body>
<script>
	//검색 기록 추가
	window.onload = function() {
		if(localStorage.getItem('searWord') != null) {
			$('#miniSearchTable').append("<tr><td class='searListWord' style='width: 90%'>"+localStorage.getItem('searWord')+"</td><td style='width: 10% text-align: right;'><span class='searListDel'>X</span></td></tr>")
		}	
	}
	
	//검색어가 없을 경우 submit x
	function searchSubmit() {
		if($('#search').val().trim() != "" && $('#search').val() != null) {
			localStorage.setItem('searWord', $('#search').val())
			return true;
		}
		return false;
	}
	
	//검색어 클릭 시 검색 기록 확인
	$('#search').click(function() {
		if(localStorage.getItem('searWord') != null) {
			$('#miniSearch').css('display', 'block');	
		}
	})
	
	//trendy 단어 더보기
    $('#plusTrendy').click(function() {
        $('#plusTrendy').css('display', 'none');
        $('#trendyDiv').css('overflow', 'inherit');
    })
</script>
</html>