<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modal Example</title>
    <link rel="stylesheet" href="./css/login.css">
    <style>
        /* 모달 배경 (기본적으로 숨김) */
        .modal-background {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1;
        }

        /* 모달 창 */
        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* 닫기 버튼 */
        .close-btn {
            float: right;
            font-size: 18px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <!-- 모달 열기 버튼 -->
    <div class="container">
    <button onclick="openModal()">회원탈퇴</button>
	</div>
    <!-- 모달 구조 -->
    <div class="modal-background" id="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
           <h2>회원탈퇴</h2> 
            <p>
            웹사이트에서 test회원님의 계정이 삭제됩니다. 
            탈퇴 시 개인정보 및 이용정보가 삭제되며 복구할 수 없습니다.
            본인의 비밀번호를 입력한 후 하단의 유의사항 동의에 체크하세요.
            </p>
            <button onclick="closeModal()">돌아가기</button>
            <button onclick="()">탈퇴하기</button>
        </div>
    </div>

    <script>
        // 모달 열기 함수
        function openModal() {
            document.getElementById("modal").style.display = "flex";
        }

        // 모달 닫기 함수
        function closeModal() {
            document.getElementById("modal").style.display = "none";
        }

        // 모달 외부 클릭 시 닫기
        window.onclick = function(event) {
            const modal = document.getElementById("modal");
            if (event.target === modal) {
                closeModal();
            }
        }
    </script>

<body>
</html>