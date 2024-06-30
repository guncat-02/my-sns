<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>momentum</title>
<!-- 다크 테마를 기본 값으로-->
<link id="theme-setting" rel="stylesheet" href="./resources/css/dark_theme.css">
<link rel="stylesheet" href="./resources/css/profileShow.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
</head>
<body class="theme">
	<input type="hidden" value="${profile.photo}" id="photo">
	<div id="back" class="theme">
		<span id="backBtn"><a href="main">&lang;</a></span>
		<div id="myProInfo">
			<span id="myNick">${profile.nickName}</span> <span class="myDetail">( </span> <span id="myId" class="myDetail">${profile.id}</span> <span class="myDetail"> )</span>
		</div>
		<div id="myProfileSetting">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
                <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" />
            </svg>
		</div>
		<div id="settingMenu">
			<table>
				<tr>
					<td><a href="profileEdit">프로필 수정</a></td>
				</tr>
				<tr>
					<td><a href="#">기타 프로필</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="myProfile">
		<div id="myImg">
			<div id="myImgCircle">
				<img class="proImg">
			</div>
		</div>
		<div id="myInfo">
			<div id="myFollow">
				<table>
					<tr>
						<th style="width: calc(100%/ 3);">게시물</th>
						<th style="width: calc(100%/ 3);"><a href="#">FOLLOWING</a></th>
						<th style="width: calc(100%/ 3);"><a href="#">FOLLOWER</a></th>
					</tr>
					<tr>
						<td>${postlength}</td>
						<td>${following}</td>
						<td>${follower}</td>
					</tr>
				</table>
			</div>
			<div id="myBio">
				<table>
					<tr>
						<td><span>${profile.tel}</span></td>
					</tr>
					<tr>
						<td><span>${profile.bio}</span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="myMenu" class="theme">
		<input type="button" class="myMenuItem theme" value="POST" onclick="postbut('${profile.id}')"> <input type="button" class="myMenuItem theme" value="REPOST" onclick="repostbut('${profile.id}')"> <input type="button" class="myMenuItem theme" value="COMMENT" onclick="commentbut('${profile.id}')"> <input type="button" class="myMenuItem theme" value="MEDIA" onclick="mediabut('${profile.id}')"> <input type="button" class="myMenuItem theme" value="LOVE" onclick="lovebut('${profile.id}')">
	</div>
	<div class = "myComment">
		<div class = "c_pro">
			<span class="c_name theme_font">${profile.nickName}</span> <span class="addspan">'s Comments</span>
			<p class="c_cnt">댓글 <span class="addspan2"> ${mycommcnt}</span></p>
		</div>
		<c:forEach items="${mycpList }" var = "mcp">
			<a href="myPost?no=${mcp.no }">
			<div class = "pc_cont"><div class="mcpid">${mcp.id}</div> <div class = "mcpcont"><b>${mcp.cont }</b></div>
				<div class="prephoto">
					 <img src="download?filename=${mcp.filename[0]}"> 
				</div> 
			</div>
			</a>
			<c:forEach items="${myCommList }" var = "mc">
				<c:if test="${mcp.no eq mc.no}">
				<div class = "mc_div">
					<div class="mc_id">${mc.id }</div>
					<div class="mc_comm">${mc.c_cont }</div>
					<div class="mc_like">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
</svg> ${mc.c_like } 
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16">
  <path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856s-.036.586-.113.856c-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a10 10 0 0 1-.443-.05 9.36 9.36 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a9 9 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581s-.027-.414-.075-.581c-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.2 2.2 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.9.9 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1"/>
</svg>	${mc.c_dislike }</div>
				</div>
        </c:if>
			</c:forEach>
		</c:forEach>

	</div>
</body>

<script>
    //설정 버튼 클릭 시 메뉴 띄우는 메서드
    document.querySelector('#myProfileSetting').addEventListener('click', () => {
        const menu = document.querySelector('#settingMenu');
        if (menu.style.display == "block") {
            menu.style.display = "none";
        } else {
            menu.style.display = "block";
        }
    })
    
    //프로필 불러오기
    window.onload = function() {
        const img = document.querySelector('.proImg');
        const photo = document.querySelector('#photo');
  
        if(photo.value != "" && photo.value != null) {
            img.src = "download?filename="+photo.value;
        } else {
            img.src = "./resources/img/프로필.png";
        }
    }

    function postbut(id) {
   	 location.href = "profileShow?id="+id;
   }
   function commentbut(id) {
   	location.href = "profileComment?id="+id;
   }
   function mediabut(id) {
  	 	location.href = "profileMedia?id="+id;
  }
   function lovebut(id) {
  	 	location.href = "profileLove?id="+id;
  }
    
    function p_show(no) {
		$.ajax({
			type:"GET",
			url:"p_show",
			data: {"no" : no},
			cache : false,
			success:function() {
				}
		 })  
	}
     
    
</script>
</html>