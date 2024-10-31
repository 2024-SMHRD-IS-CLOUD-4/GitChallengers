<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reading Post</title>
    <link rel="stylesheet" href="./css/chWrite.css">
</head>
<body>

<div class="card">
    <!-- Back Button -->
    <button class="back-button" onclick="history.back()">←</button>
    
    <input type="text" class="title" placeholder="제목">
    
    <!-- Label for Image Upload -->
    <label for="file-input">
        <img id="preview-image" src="https://via.placeholder.com/150x120" alt="Upload Image">
    </label>
    <input type="file" id="file-input" accept="image/*" onchange="previewImage(event)">
    
    <input type="text" class="page-info-input" placeholder="페이지: 120~150p">
    <textarea class="content" placeholder="자유 내용"></textarea>
    
    <div class="footer">
        <div class="toggle-buttons">
            <button id="personal-button" onclick="toggleSelection('personal')">개인</button>
            <button id="group-button" onclick="toggleSelection('group')">단체</button>
        </div>
        <button class="action-button">글 작성</button>
    </div>
</div>

<script>
    function previewImage(event) {
        const preview = document.getElementById('preview-image');
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }

    function toggleSelection(type) {
        const personalButton = document.getElementById('personal-button');
        const groupButton = document.getElementById('group-button');
        
        if (type === 'personal') {
            personalButton.classList.add('active');
            groupButton.classList.remove('active');
        } else {
            personalButton.classList.remove('active');
            groupButton.classList.add('active');
        }
    }
</script>

</body>
</html>
