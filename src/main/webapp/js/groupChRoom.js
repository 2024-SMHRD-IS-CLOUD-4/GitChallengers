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
// 돋보기 버튼 클릭 시 검색창 및 옵션 표시
document.getElementById('searchIcon').addEventListener('click', function () {
    const navLinks = document.querySelector('.nav-links');
    const searchOptions = document.getElementById('searchOptions');
    const searchInput = document.getElementById('searchInput');

    if (searchInput.classList.contains('hidden')) {
        navLinks.classList.add('hidden'); // 챌린지 링크 숨기기
        searchOptions.classList.remove('hidden'); // 검색 옵션 보이기
        searchInput.classList.remove('hidden'); // 검색창 보이기

        // 검색 옵션과 검색창을 헤더의 중앙으로 위치시키고 검색창 왼쪽에 검색 옵션 배치
        searchOptions.style.position = 'absolute';
        searchOptions.style.left = '50%';
        searchOptions.style.transform = 'translateX(-50%)';
        searchInput.style.position = 'relative';
        searchInput.style.left = '0';
        searchInput.style.marginLeft = '10px'; // 검색 옵션 옆으로 위치
        searchInput.focus(); // 검색창에 포커스
    } else {
        navLinks.classList.remove('hidden'); // 챌린지 링크 보이기
        searchOptions.classList.add('hidden'); // 검색 옵션 숨기기
        searchInput.classList.add('hidden'); // 검색창 숨기기

        // 위치 초기화
        searchOptions.style.position = '';
        searchOptions.style.left = '';
        searchOptions.style.transform = '';
        searchInput.style.position = '';
        searchInput.style.left = '';
        searchInput.style.marginLeft = '';
    }
});

// 검색창 이외 영역 클릭 시 검색창 및 옵션 숨기기
document.addEventListener('click', function (event) {
    const searchInput = document.getElementById('searchInput');
    const searchIcon = document.getElementById('searchIcon');
    const searchOptions = document.getElementById('searchOptions');
    const navLinks = document.querySelector('.nav-links');

    if (!searchInput.classList.contains('hidden') && event.target !== searchInput && event.target !== searchIcon && event.target !== searchOptions && !searchOptions.contains(event.target)) {
        searchInput.classList.add('hidden'); // 검색창 숨기기
        navLinks.classList.remove('hidden'); // 챌린지 링크 보이기
        searchOptions.classList.add('hidden'); // 검색 옵션 숨기기

        // 위치 초기화
        searchOptions.style.position = '';
        searchOptions.style.left = '';
        searchOptions.style.transform = '';
        searchInput.style.position = '';
        searchInput.style.left = '';
        searchInput.style.marginLeft = '';
    }
});
const searchInput = document.getElementById('searchInput');
searchInput.style.width = '600px';
searchInput.style.height = '30px';
const searchOptions = document.getElementById('searchOptions');
searchOptions.style.height = '30px';
