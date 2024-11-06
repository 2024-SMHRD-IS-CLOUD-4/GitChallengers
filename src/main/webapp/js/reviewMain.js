// MY 챌린지 버튼 클릭 시 팝업 토글
document.querySelector('.nav-links a').addEventListener('click', function (event) {
    event.preventDefault();

    const popup = document.getElementById('myChallengePopup');
    const container = document.querySelector('.container');
    const myChallengeButton = event.currentTarget;

    // 팝업 위치 설정
    const rect = myChallengeButton.getBoundingClientRect();
    popup.style.top = `${rect.bottom + window.scrollY}px`;
    popup.style.left = `${rect.left}px`;

    if (popup.classList.contains('hidden')) {
        popup.classList.remove('hidden');
        container.classList.add('blur-background');
    } else {
        popup.classList.add('hidden');
        container.classList.remove('blur-background');
    }
});

// 팝업 외부 클릭 시 닫기
document.addEventListener('click', function (event) {
    const popup = document.getElementById('myChallengePopup');
    const myChallengeButton = document.querySelector('.nav-links a');

    if (!popup.contains(event.target) && event.target !== myChallengeButton) {
        popup.classList.add('hidden');
        document.querySelector('.container').classList.remove('blur-background');
    }
});

// 팝업 내부 버튼 클릭 이벤트
document.querySelectorAll('.popup-button').forEach(button => {
    button.addEventListener('click', function () {
        alert(`${this.textContent} 버튼을 클릭했습니다.`);
    });
});
