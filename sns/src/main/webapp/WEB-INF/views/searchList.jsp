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
                    <input type="search" id="search" placeholder="SEARCH" autocomplete='off' name="keyWord">
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
<script>
	let searWord;

	//검색 기록 추가
	window.onload = function() {
		if(localStorage.getItem('${id}') != null) {
			searWord = localStorage.getItem('${id}')
			searchList();
		}	
	}
	
	//검색 기록 띄우기
	function searchList() {
		$('#miniSearchTable').empty();
		if(localStorage.getItem('${id}') != null) {
			let myList = searWord.split('/');
			for(let i = 0; i <myList.length; i++) {
				$('#miniSearchTable').append("<tr><td class='searListWord' style='width: 90%'>"+myList[i]+"</td><td style='width: 10%; text-align: right;'><span class='searListDel'>X</span></td></tr>");	
			}
		} else {
			$('#miniSearch').css('display', 'none');
		}
	}
	
	//검색어가 없을 경우 submit x
	function searchSubmit() {
		if($('#search').val().trim() != "" && $('#search').val() != null) {
			if(localStorage.getItem('${id}') != null) {
				let myList = searWord.split('/');
				let myWord;
				for(let i = 0; i < myList.length; i++) {
					if($('#search').val() == myList[i]) {
						myWord = myList[i];
						myList.splice(i, 1)
						break;
					}
				}
				if(myWord != null) {
					if(myList.length == 0) {
						localStorage.setItem('${id}', $('#search').val())
					} else {
						searWord = "";
						for(let i = 0; i < myList.length; i++) {
							if(myList[i] != null && myList[i].trim() != "") {
								if(i == myList.length-1) {
				        			searWord += myList[i]
				        		} else {
				        			searWord += myList[i]+"/"
				        		}
							}
						}
						localStorage.setItem('${id}', $('#search').val()+"/"+searWord)
					}
				} else {
					localStorage.setItem('${id}', $('#search').val()+"/"+searWord)
				}
			} else {
				localStorage.setItem('${id}', $('#search').val())
			}
			return true;
		}
		return false;
	}
	
	//검색어 클릭 시 검색 기록 확인
	$('#search').click(function() {
		if(localStorage.getItem('${id}') != null) {
			$('#miniSearch').css('display', 'block');	
		}
	})
    
    //삭제 버튼 누를 시 값 삭제
    $('#miniSearchTable').on('click', '.searListDel', function() {
    	let index = $('.searListDel').index($(this))
    	let word = searWord.split('/')
    	word.splice(index, 1);
    	searWord = "";
    	if(word.length == 0) {
    		localStorage.removeItem('${id}')
    		searchList();
    	} else {
    		for(let i = 0; i < word.length; i++) {
        		if(i == word.length-1) {
        			searWord += word[i]
        		} else {
        			searWord += word[i]+"/"
        		}
        	}
    		localStorage.setItem('${id}', searWord);
    		searchList();
    	}
    })
    
    //모두 지우기 버튼을 누를 시
    $('#searDel').click(function() {
    	searWord = "";
    	localStorage.removeItem('${id}')
		searchList();
    })
    
    //검색어 누르면 자동으로 값 입력
    $('#miniSearchTable').on('click', '.searListWord', function() {
    	$('#search').val($(this).text());
    	$('form').submit();
    })
    
	//검색기록 안 보이게 만들기
    $('#searchBar').mouseleave(function() {
    	if($('#miniSearch').css('display') == 'block') {
    		$('#miniSearch').css('display', 'none');
    	}
    })
</script>
</html>