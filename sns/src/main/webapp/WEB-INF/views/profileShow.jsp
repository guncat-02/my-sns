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
<link rel="stylesheet" href="./resources/css/profileShow.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body class="theme">
    <div id="back" class="theme">
        <span id="backBtn"><a href="main">&lang;</a></span>
        <div id="myProInfo">
            <span id="myNick">${profile.nickName}</span>
            <span class="myDetail">( </span>
            <span id="myId" class="myDetail">${profile.id}</span>
            <span class="myDetail"> )</span>
        </div>
        <div id="myProfileSetting">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear-fill"
                viewBox="0 0 16 16">
                <path
                    d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" />
            </svg>
        </div>
        <div id="settingMenu">
            <table>
                <tr>
                    <td><span id="editProfile">프로필 수정<span></td>
                </tr>
                <tr>
                    <td><a href="#">기타 프로필</a></td>
                </tr>
            </table>
        </div>
    </div>
    <form id="editForm" action="profileUpdate" method="post" encType="multipart/form-data">
        <div id="myProfile">
            <div id="myImg">
                <div id="myImgCircle">
                    <img id="proImg" src="download?filename=${profile.photo}">
                </div>
                <div id="myEditCircle" class="edit">
                    <label for="myFile" id="editFile"><img id="editImg"></label>
                    <input type="file" name="myFile" id="myFile">
                </div>
            </div>
            <div id="myInfo">
                <div id="myFollow">
                    <table>
                        <tr>
                            <th style="width: calc(100% / 3);">게시물</th>
                            <th style="width: calc(100% / 3);"><a href="#">FOLLOWING</a></th>
                            <th style="width: calc(100% / 3);"><a href="#">FOLLOWER</a></th>
                        </tr>
                        <tr>
                            <td>0</td>
                            <td>${following}</td>
                            <td>${follower}</td>
                        </tr>
                    </table>
                </div>
                <div id="myBio">
                    <table>
                        <tr>
                            <td colspan="2"><input type="tel" name="tel" value="${profile.tel}" class="bioItem edit" disabled></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" name="email" value="${profile.email}" class="bioItem edit" disabled></td>
                        </tr>
                        <tr>
                            <td colspan="2"><textarea name="bio" class="bioItem edit" disabled>${profile.bio}</textarea></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="EDIT" id="editBtn" class="edit"></td>
                            <td><input type="button" value="CANCLE" id="cancleBtn" class="edit"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
    <div id="myMenu">
        <input type="button" class="myMenuItem theme" value="POST">
        <input type="button" class="myMenuItem theme" value="REPOST">
        <input type="button" class="myMenuItem theme" value="COMMENT">
        <input type="button" class="myMenuItem theme" value="MEDIA">
        <input type="button" class="myMenuItem theme" value="LOVE">
    </div>
</body>
<script>
    const edit = document.querySelectorAll('.edit');
    const editMenu = document.querySelector('#editProfile');
    const fileName = document.querySelector('#myFile');
    const img = document.querySelector('#editImg');
    const color = $('body').css("backgroundColor");

    //설정 버튼 클릭 시 메뉴 띄우는 메서드
    document.querySelector('#myProfileSetting').addEventListener('click', () => {
        const menu = document.querySelector('#settingMenu');
        if (menu.style.display == "block") {
            menu.style.display = "none";
        } else {
            menu.style.display = "block";
        }
    })

    //프로필 수정 클릭 시 div 변경
    editMenu.addEventListener('click', ()=> {
        if(editMenu.innerText == "프로필 수정") {
            editMenu.innerText = "수정 취소";
            edit.forEach(e => {
                e.style.display = "block";
                e.disabled = false;
            });
        } else if(editMenu.innerText == "수정 취소"){
            editMenu.innerText = "프로필 수정";
            for(let i = 0; i < edit.length; i++) {
                if(i == 0 || i == edit.length-1 || i == edit.length-2) {
                    edit[i].style.display = "none";
                }
                edit[i].disabled = true;
            }
            document.querySelector('#editForm').reset();
            img.removeAttribute('src');
            img.style.backgroundColor = "transparent";
        }
    })

    //파일 선택 시 미리보기
    fileName.addEventListener('change', ()=> {
        const reader = new FileReader();
        img.style.backgroundColor = color;
        reader.readAsDataURL(fileName.files[0]);
        reader.onload = function() {
            img.src = reader.result;
        }
    })

    //버튼 선택 시 파일 초기화
    edit[edit.length-1].addEventListener('click', ()=> {
    	fileName.value = null;
        img.removeAttribute('src');
        img.style.backgroundColor = "transparent";
    })
</script>
</html>