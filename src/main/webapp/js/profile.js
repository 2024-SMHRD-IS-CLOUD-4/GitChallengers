// 리뷰 내용 표시 함수
function showReview() {
    const reviewContent = document.getElementById("review-content");
    reviewContent.innerHTML = `
        <p>여기에 리뷰 내용이 표시됩니다. 사용자는 스크롤을 통해 긴 리뷰 내용을 확인할 수 있습니다.</p>
        <p>리뷰 내용 예시: 이 책은 정말 재미있고, 가족 모두가 함께 즐길 수 있습니다....</p>
    `;
}

// 작성 수 표시 함수
function showReviewCount() {
    const reviewContent = document.getElementById("review-content");
    reviewContent.innerHTML = `
        <p>총 리뷰 작성 수: 10개</p>
    `;
}

// MY 챌린지 버튼 클릭 시 팝업 토글
document.querySelector('.nav-links a').addEventListener('click', function (event) {
    event.preventDefault(); // 기본 동작 방지
    const popup = document.getElementById('myChallengePopup');
    const myChallengeButton = event.currentTarget;
    const rect = myChallengeButton.getBoundingClientRect();
    popup.style.top = `${rect.bottom + window.scrollY}px`;
    popup.style.left = `${rect.left}px`;

    popup.classList.toggle('hidden');
});

// 팝업 외부 클릭 시 닫기
document.addEventListener('click', function (event) {
    const popup = document.getElementById('myChallengePopup');
    const myChallengeButton = document.querySelector('.nav-links a');

    if (!popup.contains(event.target) && event.target !== myChallengeButton) {
        popup.classList.add('hidden');
    }
});

// 팝업 내부 버튼 클릭 이벤트
document.querySelectorAll('.popup-button').forEach(button => {
    button.addEventListener('click', function () {
        alert(`${this.textContent} 버튼을 클릭했습니다.`);
    });
});

