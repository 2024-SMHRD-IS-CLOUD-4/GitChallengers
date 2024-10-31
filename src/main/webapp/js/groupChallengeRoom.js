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
});
