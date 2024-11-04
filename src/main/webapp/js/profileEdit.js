// 뒤로가기 버튼 기능
function goBack() {
    window.history.back();
}

// 프로필 이미지 미리보기 기능
function previewImage(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const profilePic = document.querySelector('.profile-pic');
            profilePic.style.backgroundImage = `url(${e.target.result})`;
            profilePic.style.backgroundSize = 'cover';
            profilePic.style.color = 'transparent';
        };
        reader.readAsDataURL(file);
    }
}

// 팝업 내부 버튼 클릭 이벤트
document.querySelectorAll('.popup-button').forEach(button => {
    button.addEventListener('click', function () {
        alert(`${this.textContent} 버튼을 클릭했습니다.`);
    });
});
