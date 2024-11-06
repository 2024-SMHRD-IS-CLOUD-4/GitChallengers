document.addEventListener('DOMContentLoaded', function () {
    const likeButton = document.querySelector('.like');
    const likeCountSpan = document.querySelector('.like-count');
    const commentButton = document.querySelector('.comment');
    const commentCountSpan = document.querySelector('.comment-count');
    const commentsSection = document.querySelector('.comments-section');
    const commentInputSection = document.querySelector('.comment-input');
    const commentTextarea = document.querySelector('.comment-input textarea');
    const commentSubmitButton = document.querySelector('.comment-input button');
    const authorName = document.querySelector('.author').textContent;
    let likeCount = 10;
    let liked = false;
    let commentCount = 0;

    likeButton.addEventListener('click', function () {
        if (liked) {
            likeCount--;
            likeButton.classList.remove('liked');
        } else {
            likeCount++;
            likeButton.classList.add('liked');
        }
        liked = !liked;
        likeCountSpan.textContent = `좋아요 ${likeCount}개`;
    });

    commentButton.addEventListener('click', function () {
        if (commentInputSection.style.display === 'none' || commentInputSection.style.display === '') {
            commentInputSection.style.display = 'block';
            commentsSection.style.display = 'block';
        } else {
            commentInputSection.style.display = 'none';
            commentsSection.style.display = 'none';
        }
    });

    commentSubmitButton.addEventListener('click', function () {
        const comment = commentTextarea.value.trim();
        if (comment) {
            commentCount++;
            commentCountSpan.textContent = `댓글 ${commentCount}개`;
            const commentItem = document.createElement('div');
            commentItem.classList.add('comment-item');
            commentItem.innerHTML = `<strong>${authorName}:</strong> ${comment}`;
            commentsSection.appendChild(commentItem);
            commentTextarea.value = '';
            alert('댓글이 작성되었습니다.');
            // 댓글 작성 후 댓글 입력 섹션과 댓글 목록을 숨김
            commentInputSection.style.display = 'none';
            commentsSection.style.display = 'none';
        }
    });
});
