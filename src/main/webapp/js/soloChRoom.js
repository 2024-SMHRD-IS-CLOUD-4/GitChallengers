document.addEventListener("DOMContentLoaded", () => {
    // 하트 클릭 이벤트
    document.querySelectorAll('.card-icons i.heart').forEach(icon => {
        icon.addEventListener('click', () => {
            if (icon.textContent === "🤍") {
                icon.textContent = "❤️"; // 흰색 하트를 빨간 하트로 변경
            } else {
                icon.textContent = "🤍"; // 다시 클릭 시 흰색으로 변경
            }
        });
    });

    // 댓글 아이콘 클릭 시 댓글 입력창 표시
    document.querySelectorAll('.card-icons i.comment').forEach(icon => {
        icon.addEventListener('click', () => {
            const commentSection = icon.closest('.card').querySelector('.comment-section');
            commentSection.style.display = commentSection.style.display === 'none' ? 'flex' : 'none';
        });
    });

    // 댓글 작성 버튼 클릭 시 댓글 추가
    document.querySelectorAll('.comment-btn').forEach(button => {
        button.addEventListener('click', () => {
            const commentSection = button.closest('.comment-section');
            const commentInput = commentSection.querySelector('.comment-input');
            const commentList = commentSection.querySelector('.comment-list');

            if (commentInput.value.trim()) {
                // 댓글 추가
                const newComment = document.createElement('li');
                newComment.classList.add('comment-item');
                newComment.textContent = commentInput.value;
                commentList.appendChild(newComment);

                // 댓글 입력창 초기화
                commentInput.value = '';
            }
        });
    });
     // MY 챌린지 버튼 클릭 시 팝업 토글
     document.querySelector('.nav-links a').addEventListener('click', function (event) {
        event.preventDefault(); // 기본 동작 방지

        const popup = document.getElementById('myChallengePopup');
        const container = document.querySelector('.container');
        const myChallengeButton = event.currentTarget;

        // 팝업 위치를 MY 챌린지 버튼 바로 아래로 설정
        const rect = myChallengeButton.getBoundingClientRect();
        popup.style.top = `${rect.bottom + window.scrollY}px`; // 화면 상단 기준으로 버튼 아래
        popup.style.left = `${rect.left}px`; // 화면 왼쪽 기준으로 버튼 위치에 맞추기

        // 팝업 상태 확인 후 열기/닫기
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

        // 팝업과 "MY 챌린지" 버튼을 클릭한 경우가 아니면 팝업을 닫기
        if (!popup.contains(event.target) && event.target !== myChallengeButton) {
            popup.classList.add('hidden');
            document.querySelector('.container').classList.remove('blur-background');
        }
    });

    // 팝업 내부 버튼 클릭 이벤트
    document.querySelectorAll('.popup-button').forEach(button => {
        button.addEventListener('click', function () {
            alert(`${this.textContent} 버튼을 클릭했습니다.`);
            // 여기에 원하는 추가 작업을 넣을 수 있습니다.
        });
    });

});
